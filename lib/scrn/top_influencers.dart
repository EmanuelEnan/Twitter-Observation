import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:url_launcher/link.dart';
import '../api/api_follow.dart';
import '../api_model/follower_model.dart';

final suggestionFollower = FutureProvider.autoDispose
    .family<List<FollowerModel>, String>((ref, id) async {
  final apiService = ref.watch(apiServiceFollower);
  return apiService.getApi(id);
});

int apiCallCount = 0;
const int maxApiCallsPerMinute = 10;

class TopInfluencers extends ConsumerWidget {
  const TopInfluencers({Key? key, required this.searchInfo}) : super(key: key);

  final String searchInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(
      suggestionFollower(searchInfo),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top influencers'),
      ),
      body: suggestionRef.when(data: (data) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10, //data[index].includes!.users!.length,
                      itemBuilder: ((context, index1) {
                        if (data[index]
                                .response!
                                .rRealData!
                                .meta!
                                .resultCount! >
                            90) {
                          Future.delayed(const Duration(minutes: 1));
                        }
                        var tList =
                            data[index].response!.rRealData!.includes!.users!;

                        tList.sort(
                          (a, b) => b.publicMetrics!.followersCount!
                              .compareTo(a.publicMetrics!.followersCount!),
                        );
                        return Card(
                          color: const Color.fromARGB(255, 20, 42, 68),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              left: 22,
                              right: 22,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(data[index]
                                            .response!
                                            .rRealData!
                                            .includes!
                                            .users![index1]
                                            .name!),
                                        Text(
                                            '@${data[index].response!.rRealData!.includes!.users![index1].username!}'),
                                      ],
                                    ),
                                    Text(
                                      'followers: ${data[index].response!.rRealData!.includes!.users![index1].publicMetrics!.followersCount!.toString()}',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Bio: ${data[index].response!.rRealData!.includes!.users![index1].description!}',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Link(
                                    target: LinkTarget.blank,
                                    uri: Uri.parse(
                                        'https://twitter.com/${data[index].response!.rRealData!.includes!.users![index1].username}'),
                                    builder: (context, followLink) =>
                                        TextButton(
                                      onPressed: followLink,
                                      child: const Text('go to the account'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }));
                  // var nlist = data[index].includes!.users!;

                  // nlist.sort(
                  //   (a, b) => b.publicMetrics!.followersCount!
                  //       .compareTo(a.publicMetrics!.followersCount!),
                  // );

                  // }
                  // return const Text('error');
                }),
              ),
            ),
          ],
        );
      }, error: (error, _) {
        return Text(error.toString());
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
