// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import 'package:intl/intl.dart';

// import 'package:url_launcher/link.dart';

// import '../api/api_next_search.dart';
// import '../api_model/api_model_recent_search.dart';
// import '../main.dart';
// import '../model/transaction.dart';
// import 'save_folder.dart';

// class NextRecentSearch extends StatefulWidget {
//   NextRecentSearch(
//       {Key? key, required this.searchInfo, required this.nextToken})
//       : super(key: key);

//   String searchInfo;
//   String nextToken;

//   @override
//   State<NextRecentSearch> createState() => _NextRecentSearchState();
// }

// class _NextRecentSearchState extends State<NextRecentSearch> {
//   ApiNextRecentSearch apiNextRecentSearch = ApiNextRecentSearch();

//   late Box myBox;

//   @override
//   void initState() {
//     super.initState();
//     print('initstate called');
//     apiNextRecentSearch;
//     myBox = Hive.box<Transaction>(boxName);
//   }

//   // @override
//   // void dispose() {
//   //   apiNextRecentSearch;
//   //   print('dispose used');
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             height: 20,
//             width: 150,
//             child: ElevatedButton.icon(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: ((context) => const SaveFolder()),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.save),
//               label: const Text('save'),
//             ),
//           ),
//         ],
//         title: const Text('result'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder<List<ApiModelRecentSearch>>(
//               future: apiNextRecentSearch.getApi(
//                   widget.searchInfo, widget.nextToken),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.white54,
//                     ),
//                   );
//                 } else if (snapshot.hasData) {
//                   // var now = snapshot.data![0].data!.createdAt;
//                   return Column(
//                     children: [
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: ((context, index) {
//                             return ListView.builder(
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount:
//                                   snapshot.data![index].includes!.users!.length,
//                               itemBuilder: ((context, index1) {
//                                 return Card(
//                                   color: const Color.fromARGB(255, 20, 42, 68),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           index1.toString(),
//                                         ),
//                                         Text(
//                                           'Tweet created at: ${DateFormat('yyyy-MM-dd KK:mm:ss a').format(DateTime.parse(snapshot.data![index].data![index1].createdAt!)).toString()}',
//                                         ),
//                                         Row(
//                                           children: [
//                                             CircleAvatar(
//                                               radius: 17,
//                                               backgroundImage: NetworkImage(
//                                                   snapshot
//                                                       .data![index]
//                                                       .includes!
//                                                       .users![index1]
//                                                       .profileImageUrl!),
//                                             ),
//                                             const SizedBox(
//                                               width: 8,
//                                             ),
//                                             Flexible(
//                                               fit: FlexFit.loose,
//                                               child: Text(
//                                                 snapshot.data![index].includes!
//                                                     .users![index1].username!,
//                                                 overflow: TextOverflow.clip,
//                                                 style: const TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight:
//                                                         FontWeight.w500),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 8,
//                                         ),
//                                         Text(snapshot
//                                             .data![index].data![index1].text!),
//                                         const SizedBox(
//                                           height: 14,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 const FaIcon(
//                                                   FontAwesomeIcons.reply,
//                                                   size: 20,
//                                                   color: Colors.cyan,
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text(snapshot
//                                                     .data![index]
//                                                     .data![index1]
//                                                     .publicMetrics!
//                                                     .replyCount!
//                                                     .toString()),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 const FaIcon(
//                                                   FontAwesomeIcons.heart,
//                                                   size: 20,
//                                                   color: Colors.red,
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text(snapshot
//                                                     .data![index]
//                                                     .data![index1]
//                                                     .publicMetrics!
//                                                     .likeCount!
//                                                     .toString()),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 const FaIcon(
//                                                   FontAwesomeIcons.retweet,
//                                                   size: 20,
//                                                   color: Colors.lightBlue,
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text(
//                                                   snapshot
//                                                       .data![index]
//                                                       .data![index1]
//                                                       .publicMetrics!
//                                                       .retweetCount!
//                                                       .toString(),
//                                                 )
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                             Link(
//                                               target: LinkTarget.blank,
//                                               uri: Uri.parse(
//                                                   'https://twitter.com/${snapshot.data![index].includes!.users![index].username}/status/${snapshot.data![index].data![index1].id!}'),
//                                               builder: (context, followLink) =>
//                                                   TextButton(
//                                                 onPressed: followLink,
//                                                 child: const Text(
//                                                     'go to the tweet'),
//                                               ),
//                                             ),
//                                             TextButton(
//                                               onPressed: () {
//                                                 var data = snapshot.data![index]
//                                                     .data![index1].text!
//                                                     .toString();

//                                                 var link =
//                                                     'https://twitter.com/${snapshot.data![index].includes!.users![index].username}/status/${snapshot.data![index].data![index1].id!}';

//                                                 myBox.add(Transaction(
//                                                     tweet: data, link: link));
//                                               },
//                                               child:
//                                                   const Text('save the tweet'),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               }),
//                             );
//                           }),
//                         ),
//                       ),
//                       // (snapshot.data![0].meta!.resultCount! > 98)
//                       //     ? TextButton(
//                       //         // style: const ButtonStyle(),
//                       //         onPressed: () {
//                       //           var nextToken = snapshot.data![0].meta!.nextToken;

//                       //           print(nextToken);
//                       //         },
//                       //         child: const Text('load more'))
//                       //     : const Text('no more data'),
//                     ],
//                   );
//                 }

//                 return const Center(
//                   child: Text('Loading..'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
