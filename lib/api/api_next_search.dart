import 'dart:convert';


import 'package:http/http.dart' as http;

import '../api_model/api_model_recent_search.dart';
import '../tokens.dart';

class ApiNextRecentSearch {
  Tokens tokens = Tokens();

  Future<List<ApiModelRecentSearch>> getApi(
      String searchTerm, String nextToken) async {
    var slug1 = searchTerm;
    var slug2 = nextToken;
    String url =
        'https://api.twitter.com/2/tweets/search/recent?query=$slug1 lang:en -is:retweet &max_results=100&next_token=$slug2&tweet.fields=conversation_id,created_at,id,possibly_sensitive,public_metrics,reply_settings,text,withheld&expansions=author_id,referenced_tweets.id&user.fields=profile_image_url';

    // Map<String, List<String>> qParams = {
    //   'user.fields': ['created_at', 'description', 'entities'],
    // };

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final response = await http.get(
      uri,
      headers: {
        "Authorization": tokens.bearerToken,
        "User-Agent": "v2UserLookupJS",
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
        return service
            .map((json) => ApiModelRecentSearch.fromJson(json))
            .toList();
        // return ApiModelRecentSearch.fromJson(jsonDecode(resp));
        //
      }
    } catch (e) {
      print(e.toString());
    }

    throw Exception('${response.statusCode}');
  }
}
