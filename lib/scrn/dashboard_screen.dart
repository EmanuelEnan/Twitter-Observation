import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:twitter_observation/api_model/amount_model.dart';

import '../api/api_amount.dart';

final tweetFutureProvider = FutureProvider.autoDispose
    .family<List<AmountModel>, String>((ref, id) async {
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
                  const Text('Total tweet count (last 7 days)'),
                  Text('${data[0].response!.meta!.totalTweetCount}'),
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
                        {
                          'domain': DateFormat('EEEE')
                              .format(DateTime.parse(
                                  data[0].response!.data![0].end!))
                              .toString(),
                          'measure': data[0].response!.data![0].tweetCount
                        },
                        {
                          'domain': DateFormat('EEEE')
                              .format(DateTime.parse(
                                  data[0].response!.data![1].end!))
                              .toString(),
                          'measure': data[0].response!.data![1].tweetCount
                        },
                        {
                          'domain': DateFormat('EEEE')
                              .format(DateTime.parse(
                                  data[0].response!.data![2].end!))
                              .toString(),
                          'measure': data[0].response!.data![2].tweetCount
                        },
                        {
                          'domain': DateFormat('EEEE')
                              .format(DateTime.parse(
                                  data[0].response!.data![3].end!))
                              .toString(),
                          'measure': data[0].response!.data![3].tweetCount
                        },
                        {
                          'domain': DateFormat('EEEE')
                              .format(DateTime.parse(
                                  data[0].response!.data![4].end!))
                              .toString(),
                          'measure': data[0].response!.data![4].tweetCount
                        },
                        {
                          'domain': DateFormat('EEEE')
                              .format(DateTime.parse(
                                  data[0].response!.data![5].end!))
                              .toString(),
                          'measure': data[0].response!.data![5].tweetCount
                        },
                        {
                          'domain': DateFormat('EEEE')
                              .format(DateTime.parse(
                                  data[0].response!.data![6].end!))
                              .toString(),
                          'measure': data[0].response!.data![6].tweetCount
                        },
                      ],
                    },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  measureLabelColor: Colors.white,
                  domainLabelColor: Colors.white,
                  showDomainLine: true,
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
