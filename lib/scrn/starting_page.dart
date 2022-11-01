
import 'package:flutter/material.dart';

import '../category_scrn/picked_thread.dart';
import 'recent_search_field.dart';
import 'save_folder.dart';


class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  // List displayList = [const CaseStudies(), const GrowthFun()];

  // List newList = [];

  // @override
  // void initState() {
  //   newList = displayList;
  //   super.initState();
  // }

  // void runFilter(String enteredKeyword) {
  //   List results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = displayList;
  //   } else {
  //     results = displayList;
  //   }
  //   setState(() {
  //     newList = results;
  //   });
  // }
  // int _page = 0;

  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // var allPage = [const SaveFolder(), HomePage(), RecentSearchField()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   key: _bottomNavigationKey,
      //   items: const [
      //     Icon(
      //       Icons.add,
      //       size: 30,
      //       color: Colors.purple,
      //     ),
      //     Icon(
      //       Icons.list,
      //       size: 30,
      //       color: Colors.purple,
      //     ),
      //     Icon(
      //       Icons.compare_arrows,
      //       size: 30,
      //       color: Colors.purple,
      //     ),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _page = index;
      //     });
      //   },
      // ),
      appBar: AppBar(
        title: const Text('Options'),
      ),
      body:
          // allPage[_page],
          SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TextField(
            //   onChanged: (value) => runFilter(value),
            //   decoration: const InputDecoration(
            //       labelText: 'Search', prefixIcon: Icon(Icons.search)),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => HomePage(),
            //       ),
            //     );
            //   },
            //   child: const Text('Get account information'),
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => RecentSearchField()),
                  ),
                );
              },
              child: const Text('Get search results'),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const SaveFolder()),
                  ),
                );
              },
              child: const Text('Saved Folder'),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const PickedThread()),
                  ),
                );
              },
              child: const Text('Pick a Thread'),
            ),
          ],
        ),
      ),
    );
  }
}
