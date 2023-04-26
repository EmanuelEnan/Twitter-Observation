// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:twitter_observation/api/api_search.dart';

// class TempScreen extends StatefulWidget {
//   const TempScreen({super.key});

//   @override
//   State<TempScreen> createState() => _TempScreenState();
// }

// class _TempScreenState extends State<TempScreen> {
//   ApiSearch apiSearch = ApiSearch();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: apiSearch.data.length,
//         itemBuilder: (context, index) {
//           final datum = apiSearch.data[index];
//           return ListTile(
//             title: Text(datum.response!.rRealData!.data!.first.text!),
//           );
//         },
//       ),
//     );
//   }
// }
