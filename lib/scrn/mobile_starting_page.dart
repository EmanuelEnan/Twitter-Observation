import 'package:flutter/material.dart';
import 'package:twitter_observation/scrn/Feature_responsive.dart';
import 'package:twitter_observation/scrn/dashboard_screen.dart';
import 'package:twitter_observation/widgets/buttons.dart';

import '../category_scrn/picked_thread.dart';
import 'feature_dashboard.dart';
import 'save_folder.dart';

class MobileStartingPage extends StatefulWidget {
  const MobileStartingPage({Key? key}) : super(key: key);

  @override
  State<MobileStartingPage> createState() => _MobileStartingPageState();
}

class _MobileStartingPageState extends State<MobileStartingPage> {
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

      body:
          // allPage[_page],
          SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(
              top: 35,
              bottom: 35,
              right: 16,
              left: 16,
            ),
            // width: MediaQuery.of(context).size.width * .6,
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    const Text(
                      'Features',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 0, 155, 155),
                      ),
                    ),
                  ],
                ),
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
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: colorButton,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const FeatureResponsivePage()),
                      ),
                    );
                  },
                  child: const Text('Feature Dashboard'),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: colorButton,
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
                  style: colorButton,
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
        ),
      ),
    );
  }
}
