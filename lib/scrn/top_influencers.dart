import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:twitter_observation/api/api_followers.dart';
import 'package:url_launcher/link.dart';
import '../api_model/follower_model.dart';
import '../main.dart';
import '../model/transaction.dart';

import 'save_folder.dart';

final suggestionFollower =
    FutureProvider.family<List<FollowerModel>, String>((ref, id) async {
  final apiService = ref.watch(apiServiceFollower);
  return apiService.getApi(id);
});

int apiCallCount = 0;
const int maxApiCallsPerMinute = 10;

class TopInfluencers extends ConsumerWidget {
  TopInfluencers({Key? key, required this.searchInfo}) : super(key: key);

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
                        if (data[index].meta!.resultCount! > 90) {
                          Future.delayed(const Duration(minutes: 1));
                        }
                        var tList = data[index].includes!.users!;

                        tList.sort(
                          (a, b) => b.publicMetrics!.followersCount!
                              .compareTo(a.publicMetrics!.followersCount!),
                        );
                        return Card(
                          color: const Color.fromARGB(255, 20, 42, 68),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                            .includes!
                                            .users![index1]
                                            .name!),
                                        Text(
                                            '@${data[index].includes!.users![index1].username!}'),
                                      ],
                                    ),
                                    Text(
                                      'followers: ${data[index].includes!.users![index1].publicMetrics!.followersCount!.toString()}',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    'Bio: ${data[index].includes!.users![index1].description!}'),
                                Center(
                                  child: Link(
                                    target: LinkTarget.blank,
                                    uri: Uri.parse(
                                        'https://twitter.com/${data[index].includes!.users![index1].username}'),
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
