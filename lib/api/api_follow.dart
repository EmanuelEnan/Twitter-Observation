import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_observation/api_model/follower_model.dart';
import '../tokens.dart';

final apiServiceFollower = Provider<ApiFollowers>((ref) => ApiFollowers());

class ApiFollowers {
  Tokens tokens = Tokens();

  Future<List<FollowerModel>> getApi(String searchTerm) async {
    // var slug = searchTerm;
    String url = tokens.searchUrl;

    Map<String, String> param = {
      "prompt": searchTerm,
    };

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final response = await http.post(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: jsonEncode(param),
      // headers: {
      //   "Authorization": tokens.bearerToken,
      //   "User-Agent": "v2UserLookupJS",
      //   // "Access-Control-Allow-Origin": "*",
      //   // 'Content-Type': 'application/json',
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Methods": "GET,PUT,PATCH,POST,DELETE",
      //   "Access-Control-Allow-Headers":
      //       "Origin, X-Requested-With, Content-Type, Accept"
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
