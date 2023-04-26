import 'package:flutter/material.dart';
import 'package:twitter_observation/scrn/starting_page.dart';
import 'package:twitter_observation/widgets/buttons.dart';
import 'package:video_player/video_player.dart';

import '../widgets/video_player_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // final authService = AuthService();

  final asset = 'videos/video_2.mp4';
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      // ..initialize().then((_) {
      //   controller.setVolume(0);
      //   controller.play();
      //   controller.setLooping(true);
      //   setState(() {});
      // });
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 25,
                bottom: 25,
              ),
              width: MediaQuery.of(context).size.width * .6,
              // height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TwitObservation',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      landingButtons(context),
                    ],
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    'Discover the Power of TwitObservation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  const Text(
                    'Gain Insights and Stay Ahead of the Game with our TwitObservation Tool',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 0, 190, 190),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  const Text(
                    'Welcome to our TwitObservation tool, the perfect tool for businesses and individuals looking to gain insights into Twitter conversations related to their brand, products, or interests. Our tool provides valuable information that can help you stay ahead of the game and make informed decisions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  landingButtons(context),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    '( no cc or email required, just click to enter )',
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  VideoPlayerWidget(controller: controller),
                  const SizedBox(
                    height: 50,
                  ),

                  const Text(
                    'What can you do with our Twitter observation tool?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  GridView.count(
                    // primary: false,
                    // padding: const EdgeInsets.all(20),
                    childAspectRatio: itemWidth / itemHeight,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(11),
                          color: Colors.teal[100],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Search for Tweets',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Search for tweets related to your brand, product, or interests using our advanced search algorithm. Get real-time updates on tweets, retweets, likes, and users talking about your search term.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
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
                            children: const [
                              Text(
                                'See Tweet Counts',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Get a clear picture of how many tweets have happened on your search term in the past week or any custom time period you want.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
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
                            children: const [
                              Text(
                                'Top Liked Tweet',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Identify and see the pattern of the tweet that has received the most likes for your search term.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
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
                            children: const [
                              Text(
                                'Top Contributors',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'See who the top contributors are for your search term. Get insights on who is driving the conversation and engage with them directly.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
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
                            children: const [
                              Text(
                                'Hand-picked Threads',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Get inspirations from curated threads on various topics sensibly picked by us.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[600],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Save for Later',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              Text(
                                'Save any tweet or thread to come back later.',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Ready to step-up?',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Try our TwitObservation tool today and start gaining valuable insights into Twitter conversations related to your brand, products, or interests.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  landingButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
