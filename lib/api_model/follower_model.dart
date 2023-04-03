class FollowerModel {
  List<Data>? data;
  Includes? includes;
  Meta? meta;

  FollowerModel({this.data, this.includes, this.meta});

  FollowerModel.fromJson(Map<String, dynamic> json) {
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
  String? conversationId;

  String? authorId;
  String? lang;
  bool? possiblySensitive;
  String? id;
  String? createdAt;
  String? replySettings;
  String? source;
  List<String>? editHistoryTweetIds;
  String? text;
  // Geo? geo;

  Data(
      {this.conversationId,
      this.authorId,
      this.lang,
      this.possiblySensitive,
      this.id,
      this.createdAt,
      this.replySettings,
      this.source,
      this.editHistoryTweetIds,
      this.text,
      });

  Data.fromJson(Map<String, dynamic> json) {
    conversationId = json['conversation_id'];
    authorId = json['author_id'];
    lang = json['lang'];
    possiblySensitive = json['possibly_sensitive'];
    id = json['id'];
    createdAt = json['created_at'];
    replySettings = json['reply_settings'];
    source = json['source'];
    editHistoryTweetIds = json['edit_history_tweet_ids'].cast<String>();
    text = json['text'];
    // geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['conversation_id'] = conversationId;

    data['author_id'] = authorId;
    data['lang'] = lang;
    data['possibly_sensitive'] = possiblySensitive;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['reply_settings'] = replySettings;
    data['source'] = source;
    data['edit_history_tweet_ids'] = editHistoryTweetIds;
    data['text'] = text;
    // if (geo != null) {
    //   data['geo'] = geo!.toJson();
    // }
    return data;
  }
}

class Includes {
  List<Users>? users;
  List<Places>? places;

  Includes({this.users, this.places});

  Includes.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(Places.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    if (places != null) {
      data['places'] = places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? url;
  bool? protected;
  String? description;
  String? id;
  PublicMetrics? publicMetrics;
  String? createdAt;
  bool? verified;
  String? username;
  String? location;
  String? name;

  Users(
      {this.url,
      this.protected,
      this.description,
      this.id,
      this.publicMetrics,
      this.createdAt,
      this.verified,
      this.username,
      this.location,
      this.name});

  Users.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    protected = json['protected'];
    description = json['description'];
    id = json['id'];
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
    createdAt = json['created_at'];
    verified = json['verified'];
    username = json['username'];
    location = json['location'];
    name = json['name'] ?? 'null';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['protected'] = protected;
    data['description'] = description;
    data['id'] = id;
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    data['created_at'] = createdAt;
    data['verified'] = verified;
    data['username'] = username;
    data['location'] = location;
    data['name'] = name;
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

class Places {
  // Geo? geo;
  String? country;
  String? countryCode;
  String? name;
  String? fullName;
  String? id;
  String? placeType;

  Places(
      {
      this.country,
      this.countryCode,
      this.name,
      this.fullName,
      this.id,
      this.placeType});

  Places.fromJson(Map<String, dynamic> json) {
    // geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
    country = json['country'];
    countryCode = json['country_code'];
    name = json['name'];
    fullName = json['full_name'];
    id = json['id'];
    placeType = json['place_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (geo != null) {
    //   data['geo'] = geo!.toJson();
    // }
    data['country'] = country;
    data['country_code'] = countryCode;
    data['name'] = name;
    data['full_name'] = fullName;
    data['id'] = id;
    data['place_type'] = placeType;
    return data;
  }
}

// class Geo {
//   String? type;
//   List<double>? bbox;

//   Geo({this.type, this.bbox});

//   Geo.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     bbox = json['bbox'].cast<double>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['type'] = type;
//     data['bbox'] = bbox;

//     return data;
//   }
// }

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
