import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../api_model/api_model_recent_search.dart';
import '../api_model/tweet_amount_model.dart';
import '../tokens.dart';

final apiServiceTweet =
    Provider<ApiServiceTweetAmount>((ref) => ApiServiceTweetAmount());

class ApiServiceTweetAmount {
  Tokens tokens = Tokens();

  Future<List<TweetAmount>> getApi(String searchTerm) async {
    var slug = searchTerm;
    String url =
        'https://api.twitter.com/2/tweets/counts/recent?query=$slug&granularity=day';
    // Map<String, List<String>> qParams = {
    //   'user.fields': ['created_at', 'description', 'entities'],
    // };

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final client = http.Client();

    final response = await client.get(
      uri,
      headers: {
        "Authorization": tokens.bearerToken,
        "User-Agent": "v2UserLookupJS",
        // "Access-Control-Allow-Origin": "*",
        // 'Content-Type': 'application/json',
        // 'Accept': '*/*'
        // "x-rate-limit-limit" : "20",
      },
    );

    // final resp = response.body;
    // print(resp);

    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        final resp = '[${response.body}]';
        print(resp);
        // Map services = jsonDecode(resp);
        List service = (jsonDecode(resp) as List<dynamic>);
        return service.map((json) => TweetAmount.fromJson(json)).toList();
        // return ApiModelRecentSearch.fromJson(jsonDecode(resp));
        //
      }
    } catch (e) {
      print(e.toString());
    }

    throw Exception('${response.statusCode}');
  }
}
