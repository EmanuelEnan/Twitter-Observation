import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_observation/scrn/dashboard_screen.dart';
import 'package:twitter_observation/scrn/most_liked.dart';
import 'package:twitter_observation/scrn/most_retweeted.dart';
import 'package:twitter_observation/scrn/top_influencers.dart';
import 'package:twitter_observation/widgets/buttons.dart';

import 'recent_search_info.dart';

class MobileFeaturedashboard extends StatefulWidget {
  const MobileFeaturedashboard({Key? key}) : super(key: key);

  @override
  State<MobileFeaturedashboard> createState() => _MobileFeaturedashboardState();
}

class _MobileFeaturedashboardState extends State<MobileFeaturedashboard> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight) / 2;
    // final double itemWidth = size.width / 2;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
                        'Feature Dashboard',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 0, 155, 155),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                      // filled: true,
                      // fillColor: Colors.white,
                    ),
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(
                    //     RegExp("[0-9]+#"),
                    //   ),
                    // ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GridView.count(
                    // primary: false,
                    // padding: const EdgeInsets.all(20),
                    // childAspectRatio: itemWidth / itemHeight,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: [
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(11),
                          color: Colors.teal[100],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Search for Tweets',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                'Search for tweets related to your search term',
                              ),
                              ElevatedButton(
                                style: colorButton,
                                onPressed: () {
                                  var search = _searchController.text;
                                  search.isNotEmpty
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RecentSearchInfo(
                                                    searchInfo: search),
                                          ),
                                        )
                                      : Container();
                                },
                                child: const Text('Search for tweets'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Tweet activity',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                'See a graph of tweets sent in the past week',
                              ),
                              ElevatedButton(
                                style: colorButton,
                                onPressed: () {
                                  var search = _searchController.text;
                                  search.isNotEmpty
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => DashboardScreen(
                                                searchInfo: search),
                                          ),
                                        )
                                      : Container();
                                },
                                child: const Text('Tweet activity'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Most retweeted tweets',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                'Tweets that are most retweeted',
                              ),
                              ElevatedButton(
                                style: colorButton,
                                onPressed: () {
                                  var search = _searchController.text;
                                  search.isNotEmpty
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MostRetweeted(searchInfo: search),
                                          ),
                                        )
                                      : Container();
                                },
                                child: const Text('Most retweeted tweets'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[400],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Most liked tweets',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                'Tweets that are most liked',
                              ),
                              ElevatedButton(
                                style: colorButton,
                                onPressed: () {
                                  var search = _searchController.text;
                                  search.isNotEmpty
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MostLiked(searchInfo: search),
                                          ),
                                        )
                                      : Container();
                                },
                                child: const Text('Most liked tweets'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[500],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Top influencers',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                'Influencers with most followers in your search term',
                              ),
                              ElevatedButton(
                                style: colorButton,
                                onPressed: () {
                                  var search = _searchController.text;
                                  search.isNotEmpty
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => TopInfluencers(
                                                searchInfo: search),
                                          ),
                                        )
                                      : Container();
                                },
                                child: const Text('Top influencers'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
