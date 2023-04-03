import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_observation/api_model/follower_model.dart';
import '../tokens.dart';

final apiServiceFollower =
    Provider<ApiServiceFollowers>((ref) => ApiServiceFollowers());

class ApiServiceFollowers {
  Tokens tokens = Tokens();

  Future<List<FollowerModel>> getApi(String searchTerm) async {
    var slug = searchTerm;
    String url =
        'https://api.twitter.com/2/tweets/search/recent?query=$slug lang:en -is:retweet&max_results=100&tweet.fields=conversation_id,created_at,geo,id,lang,possibly_sensitive,public_metrics,reply_settings,source,text,withheld&expansions=author_id,geo.place_id&media.fields=public_metrics,type&place.fields=contained_within,country,country_code,full_name,geo,id,name,place_type&user.fields=created_at,description,id,location,name,protected,public_metrics,url,username,verified,withheld';
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
        return service.map((json) => FollowerModel.fromJson(json)).toList();
        // return FollowerModel.fromJson(jsonDecode(resp));
        //
      }
    } catch (e) {
      print(e.toString());
    }

    throw Exception('${response.statusCode}');
  }
}
