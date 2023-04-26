import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_observation/api_model/search_model.dart';

import '../tokens.dart';

final apiProvider = Provider<ApiSearch>((ref) => ApiSearch());

class ApiSearch {
  Tokens tokens = Tokens();
  // List<SearchModel> data = [];

  Future<List<SearchModel>> getApi(String searchTerm) async {
    // List<Data> get data => _data;

    // var slug = searchTerm;
    // String url =
    //     'https://api.twitter.com/2/tweets/search/recent?query=$slug &max_results=100&tweet.fields=conversation_id,created_at,id,possibly_sensitive,public_metrics,reply_settings,text,withheld&expansions=author_id,referenced_tweets.id&user.fields=profile_image_url';

    String url = tokens.searchUrl;

    Map<String, String> param = {
      "prompt": searchTerm,
    };

    // Map<String, List<String>> qParams = {
    //   'user.fields': ['created_at', 'description', 'entities'],
    // };

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final response = await http.post(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: jsonEncode(param),
      // headers: {
      //   "Authorization": tokens.bearerToken,
      //   "User-Agent": "v2UserLookupJS",
      //   "Access-Control-Allow-Origin": "http://localhost:53213",
      //   'Content-Type': 'application/json',
      //   // 'Accept': '*/*'
      //   // "x-rate-limit-limit" : "20",
      // },
    );

    // final resp = response.body;
    // print(resp);

    try {
      if (response.statusCode == 200) {
        // print(response.statusCode);
        final resp = '[${response.body}]';
        // print(resp);
        // Map services = jsonDecode(resp);
        List service = (jsonDecode(resp) as List<dynamic>);

        return service.map((json) => SearchModel.fromJson(json)).toList();

        // return ApiModelRecentSearch.fromJson(jsonDecode(resp));
        //
      }
    } catch (e) {
      print(e.toString());
    }

    throw Exception('${response.statusCode}');
  }
}
