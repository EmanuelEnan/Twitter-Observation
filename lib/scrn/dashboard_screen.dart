import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_observation/api/api_tweet_amount.dart';

import '../api_model/tweet_amount_model.dart';

final tweetFutureProvider =
    FutureProvider.family<List<TweetAmount>, String>((ref, id) async {
  final apiService = ref.watch(apiServiceTweet);
  return apiService.getApi(id);
});

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key, required this.searchInfo}) : super(key: key);

  final String searchInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tweetRef = ref.watch(
      tweetFutureProvider(searchInfo),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tweet activity'),
      ),
      body: tweetRef.when(data: (data) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Total tweet count'),
                  Text('${data[0].meta!.totalTweetCount}'),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .85,
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: DChartBar(
                  data: [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': 'S', 'measure': data[0].data![0].tweetCount},
                        {
                          'domain': 'Su',
                          'measure': data[0].data![1].tweetCount
                        },
                        {'domain': 'M', 'measure': data[0].data![2].tweetCount},
                        {'domain': 'T', 'measure': data[0].data![3].tweetCount},
                        {'domain': 'W', 'measure': data[0].data![4].tweetCount},
                        {
                          'domain': 'Thu',
                          'measure': data[0].data![5].tweetCount
                        },
                        {'domain': 'F', 'measure': data[0].data![6].tweetCount},
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.deepPurpleAccent,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.deepPurpleAccent,
                  showBarValue: true,
                  animate: true,
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
