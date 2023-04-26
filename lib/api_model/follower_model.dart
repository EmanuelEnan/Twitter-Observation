class FollowerModel {
  Response? response;

  FollowerModel({this.response});

  FollowerModel.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  int? iMaxResultsWhenFetchLast;
  RealData? rRealData;
  RateLimit? rRateLimit;
  Instance? iInstance;
  QueryParams? qQueryParams;
  String? sEndpoint;

  Response(
      {this.iMaxResultsWhenFetchLast,
      this.rRealData,
      this.rRateLimit,
      this.iInstance,
      this.qQueryParams,
      this.sEndpoint});

  Response.fromJson(Map<String, dynamic> json) {
    iMaxResultsWhenFetchLast = json['_maxResultsWhenFetchLast'];
    rRealData =
        json['_realData'] != null ? RealData.fromJson(json['_realData']) : null;
    rRateLimit = json['_rateLimit'] != null
        ? RateLimit.fromJson(json['_rateLimit'])
        : null;
    iInstance =
        json['_instance'] != null ? Instance.fromJson(json['_instance']) : null;
    qQueryParams = json['_queryParams'] != null
        ? QueryParams.fromJson(json['_queryParams'])
        : null;
    sEndpoint = json['_endpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_maxResultsWhenFetchLast'] = iMaxResultsWhenFetchLast;
    if (rRealData != null) {
      data['_realData'] = rRealData!.toJson();
    }
    if (rRateLimit != null) {
      data['_rateLimit'] = rRateLimit!.toJson();
    }
    if (iInstance != null) {
      data['_instance'] = iInstance!.toJson();
    }
    if (qQueryParams != null) {
      data['_queryParams'] = qQueryParams!.toJson();
    }
    data['_endpoint'] = sEndpoint;
    return data;
  }
}

class RealData {
  List<Data>? data;
  Includes? includes;
  Meta? meta;

  RealData({this.data, this.includes, this.meta});

  RealData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    includes =
        json['includes'] != null ? Includes.fromJson(json['includes']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (includes != null) {
      data['includes'] = includes!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? authorId;
  String? id;
  List<String>? editHistoryTweetIds;
  String? text;
  String? createdAt;
  PublicMetrics? publicMetrics;

  Data(
      {this.authorId,
      this.id,
      this.editHistoryTweetIds,
      this.text,
      this.createdAt,
      this.publicMetrics});

  Data.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    id = json['id'];
    editHistoryTweetIds = json['edit_history_tweet_ids'].cast<String>();
    text = json['text'];
    createdAt = json['created_at'];
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author_id'] = authorId;
    data['id'] = id;
    data['edit_history_tweet_ids'] = editHistoryTweetIds;
    data['text'] = text;
    data['created_at'] = createdAt;
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    return data;
  }
}

class Includes {
  List<Users>? users;

  Includes({this.users});

  Includes.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? description;
  String? profileImageUrl;
  String? name;
  String? username;
  String? id;
  PublicMetrics? publicMetrics;

  Users(
      {this.description,
      this.profileImageUrl,
      this.name,
      this.username,
      this.id,
      this.publicMetrics});

  Users.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    profileImageUrl = json['profile_image_url'];
    name = json['name'];
    username = json['username'];
    id = json['id'];
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['profile_image_url'] = profileImageUrl;
    data['name'] = name;
    data['username'] = username;
    data['id'] = id;
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    return data;
  }
}

class PublicMetrics {
  int? followersCount;
  int? followingCount;
  int? tweetCount;
  int? listedCount;

  PublicMetrics(
      {this.followersCount,
      this.followingCount,
      this.tweetCount,
      this.listedCount});

  PublicMetrics.fromJson(Map<String, dynamic> json) {
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    tweetCount = json['tweet_count'];
    listedCount = json['listed_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followers_count'] = followersCount;
    data['following_count'] = followingCount;
    data['tweet_count'] = tweetCount;
    data['listed_count'] = listedCount;
    return data;
  }
}

class Meta {
  String? newestId;
  String? oldestId;
  int? resultCount;
  String? nextToken;

  Meta({this.newestId, this.oldestId, this.resultCount, this.nextToken});

  Meta.fromJson(Map<String, dynamic> json) {
    newestId = json['newest_id'];
    oldestId = json['oldest_id'];
    resultCount = json['result_count'];
    nextToken = json['next_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newest_id'] = newestId;
    data['oldest_id'] = oldestId;
    data['result_count'] = resultCount;
    data['next_token'] = nextToken;
    return data;
  }
}

class RateLimit {
  int? limit;
  int? remaining;
  int? reset;

  RateLimit({this.limit, this.remaining, this.reset});

  RateLimit.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    remaining = json['remaining'];
    reset = json['reset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['remaining'] = remaining;
    data['reset'] = reset;
    return data;
  }
}

class Instance {
  Null? nCurrentUser;
  Null? nCurrentUserV2;
  RequestMaker? rRequestMaker;
  String? sPrefix;

  Instance(
      {this.nCurrentUser,
      this.nCurrentUserV2,
      this.rRequestMaker,
      this.sPrefix});

  Instance.fromJson(Map<String, dynamic> json) {
    nCurrentUser = json['_currentUser'];
    nCurrentUserV2 = json['_currentUserV2'];
    rRequestMaker = json['_requestMaker'] != null
        ? RequestMaker.fromJson(json['_requestMaker'])
        : null;
    sPrefix = json['_prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_currentUser'] = nCurrentUser;
    data['_currentUserV2'] = nCurrentUserV2;
    if (rRequestMaker != null) {
      data['_requestMaker'] = rRequestMaker!.toJson();
    }
    data['_prefix'] = sPrefix;
    return data;
  }
}

class RequestMaker {
  RateLimits? rateLimits;

  String? bearerToken;

  RequestMaker({this.rateLimits, this.bearerToken});

  RequestMaker.fromJson(Map<String, dynamic> json) {
    rateLimits = json['rateLimits'] != null
        ? RateLimits.fromJson(json['rateLimits'])
        : null;

    bearerToken = json['bearerToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rateLimits != null) {
      data['rateLimits'] = rateLimits!.toJson();
    }
    data['bearerToken'] = bearerToken;
    return data;
  }
}

class RateLimits {
  RateLimit? httpsApiTwitterCom2TweetsSearchRecent;

  RateLimits({this.httpsApiTwitterCom2TweetsSearchRecent});

  RateLimits.fromJson(Map<String, dynamic> json) {
    httpsApiTwitterCom2TweetsSearchRecent =
        json['https://api.twitter.com/2/tweets/search/recent'] != null
            ? RateLimit.fromJson(
                json['https://api.twitter.com/2/tweets/search/recent'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (httpsApiTwitterCom2TweetsSearchRecent != null) {
      data['https://api.twitter.com/2/tweets/search/recent'] =
          httpsApiTwitterCom2TweetsSearchRecent!.toJson();
    }
    return data;
  }
}

class QueryParams {
  String? expansions;
  List<String>? userFields;
  List<String>? tweetFields;
  String? query;

  QueryParams({this.expansions, this.userFields, this.tweetFields, this.query});

  QueryParams.fromJson(Map<String, dynamic> json) {
    expansions = json['expansions'];
    userFields = json['user.fields'].cast<String>();
    tweetFields = json['tweet.fields'].cast<String>();
    query = json['query'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expansions'] = expansions;
    data['user.fields'] = userFields;
    data['tweet.fields'] = tweetFields;
    data['query'] = query;
    return data;
  }
}
