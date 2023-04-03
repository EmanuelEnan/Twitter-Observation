import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:intl/intl.dart';

import 'package:url_launcher/link.dart';

import '../api/api_service_recent_search.dart';
import '../api_model/api_model_recent_search.dart';
import '../main.dart';
import '../model/transaction.dart';

import 'save_folder.dart';

final suggestionFutureProvider =
    FutureProvider.family<List<ApiModelRecentSearch>, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getApi(id);
});

class MostLiked extends ConsumerWidget {
  MostLiked({Key? key, required this.searchInfo}) : super(key: key);

  final String searchInfo;

  final Box<Transaction> myBox = Hive.box<Transaction>(boxName);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(
      suggestionFutureProvider(searchInfo),
    );
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Container(
        //     padding: const EdgeInsets.all(12),
        //     height: 20,
        //     width: 150,
        //     child: ElevatedButton.icon(
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: ((context) => const SaveFolder()),
        //           ),
        //         );
        //       },
        //       icon: const Icon(Icons.save),
        //       label: const Text('save'),
        //     ),
        //   ),
        // ],
        title: const Text('Most liked tweets'),
      ),
      body: suggestionRef.when(data: (data) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: ((context, index1) {
                        var nlist = data[index].data!;
        
                        nlist.sort(
                          (a, b) => b.publicMetrics!.likeCount!
                              .compareTo(a.publicMetrics!.likeCount!),
                        );
                        // print(nlist.toString());
                        // var alist = [1, 0, 0, 1, 0, 0, 2, 0];
        
                        // alist.sort(
                        //   (a, b) => b.compareTo(a),
                        // );
        
                        // print(alist.toString());
        
                        // while (data[index]
                        //             .data![index1]
                        //             .publicMetrics!
                        //             .retweetCount! >
                        //         10 &&
                        //     data[index].data![index1].text!.startsWith('RT')) {
                        return Card(
                          color: const Color.fromARGB(255, 20, 42, 68),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(index1.toString()),
                                Text(
                                  'Tweet created at: ${DateFormat('yyyy-MM-dd KK:mm:ss a').format(DateTime.parse(data[index].data![index1].createdAt!)).toString()}',
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 17,
                                      backgroundImage: NetworkImage(data[index]
                                          .includes!
                                          .users![index1]
                                          .profileImageUrl!),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text(
                                        data[index]
                                            .includes!
                                            .users![index1]
                                            .name!,
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(data[index].data![index1].text!),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.heart,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      data[index]
                                          .data![index1]
                                          .publicMetrics!
                                          .likeCount!
                                          .toString(),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Link(
                                      target: LinkTarget.blank,
                                      uri: Uri.parse(
                                          'https://twitter.com/${data[index].includes!.users![index].username}/status/${data[index].data![index1].id!}'),
                                      builder: (context, followLink) =>
                                          TextButton(
                                        onPressed: followLink,
                                        child: const Text('go to the tweet'),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        var tweetData = data[index]
                                            .data![index1]
                                            .text!
                                            .toString();
        
                                        var link =
                                            'https://twitter.com/${data[index].includes!.users![index].username}/status/${data[index].data![index1].id!}';
        
                                        myBox.add(
                                          Transaction(
                                              tweet: tweetData, link: link),
                                        );
        
                                        final snackBar = SnackBar(
                                          backgroundColor:
                                              Colors.black.withOpacity(.3),
                                          duration:
                                              const Duration(milliseconds: 1000),
                                          content: const Center(
                                            child: Text('photo saved!'),
                                          ),
                                        );
        
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: const Text('save the tweet'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                        // }
                        // return const Text('error');
                      }),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }, error: (error, _) {
        return Text(error.toString());
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
