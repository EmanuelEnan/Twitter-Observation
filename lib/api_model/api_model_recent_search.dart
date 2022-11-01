class ApiModelRecentSearch {
  List<Data>? data;
  Includes? includes;
  Meta? meta;

  ApiModelRecentSearch({this.data, this.includes, this.meta});

  ApiModelRecentSearch.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? source;
  PublicMetrics? publicMetrics;
  String? text;
  List<ReferencedTweets>? referencedTweets;
  String? authorId;
  bool? possiblySensitive;
  String? replySettings;
  String? lang;
  String? conversationId;
  String? createdAt;

  Data(
      {this.id,
      this.source,
      this.publicMetrics,
      this.text,
      this.referencedTweets,
      this.authorId,
      this.possiblySensitive,
      this.replySettings,
      this.lang,
      this.conversationId,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
    text = json['text'];
    if (json['referenced_tweets'] != null) {
      referencedTweets = <ReferencedTweets>[];
      json['referenced_tweets'].forEach((v) {
        referencedTweets!.add(ReferencedTweets.fromJson(v));
      });
    }
    authorId = json['author_id'];
    possiblySensitive = json['possibly_sensitive'];
    replySettings = json['reply_settings'];
    lang = json['lang'];
    conversationId = json['conversation_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['source'] = source;
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    data['text'] = text;
    if (referencedTweets != null) {
      data['referenced_tweets'] =
          referencedTweets!.map((v) => v.toJson()).toList();
    }
    data['author_id'] = authorId;
    data['possibly_sensitive'] = possiblySensitive;
    data['reply_settings'] = replySettings;
    data['lang'] = lang;
    data['conversation_id'] = conversationId;
    data['created_at'] = createdAt;
    return data;
  }
}

class PublicMetrics {
  int? retweetCount;
  int? replyCount;
  int? likeCount;
  int? quoteCount;

  PublicMetrics(
      {this.retweetCount, this.replyCount, this.likeCount, this.quoteCount});

  PublicMetrics.fromJson(Map<String, dynamic> json) {
    retweetCount = json['retweet_count'];
    replyCount = json['reply_count'];
    likeCount = json['like_count'];
    quoteCount = json['quote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['retweet_count'] = retweetCount;
    data['reply_count'] = replyCount;
    data['like_count'] = likeCount;
    data['quote_count'] = quoteCount;
    return data;
  }
}

class ReferencedTweets {
  String? type;
  String? id;

  ReferencedTweets({this.type, this.id});

  ReferencedTweets.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    return data;
  }
}

class Includes {
  List<Users>? users;
  List<Tweets>? tweets;

  Includes({this.users, this.tweets});

  Includes.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    if (json['tweets'] != null) {
      tweets = <Tweets>[];
      json['tweets'].forEach((v) {
        tweets!.add(Tweets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    if (tweets != null) {
      data['tweets'] = tweets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  PublicMetrics? publicMetrics;
  String? url;
  bool? verified;
  String? username;
  String? description;
  String? id;
  String? createdAt;
  String? name;
  bool? protected;
  String? location;
  String? profileImageUrl;

  Users(
      {this.publicMetrics,
      this.url,
      this.verified,
      this.username,
      this.description,
      this.id,
      this.createdAt,
      this.name,
      this.protected,
      this.location,
      this.profileImageUrl});

  Users.fromJson(Map<String, dynamic> json) {
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
    url = json['url'];
    verified = json['verified'];
    username = json['username'];
    description = json['description'];
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    protected = json['protected'];
    location = json['location'] ?? 'no value';
    profileImageUrl = json['profile_image_url'] ?? 'no value';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    data['url'] = url;
    data['verified'] = verified;
    data['username'] = username;
    data['description'] = description;
    data['id'] = id;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['protected'] = protected;
    data['location'] = location;
    data['profile_image_url'] = profileImageUrl;
    return data;
  }
}

class Tweets {
  String? id;
  String? source;
  PublicMetrics? publicMetrics;
  String? text;
  String? authorId;
  bool? possiblySensitive;
  String? replySettings;
  String? lang;
  String? conversationId;
  String? createdAt;
  List<ReferencedTweets>? referencedTweets;
  Geo? geo;

  Tweets(
      {this.id,
      this.source,
      this.publicMetrics,
      this.text,
      this.authorId,
      this.possiblySensitive,
      this.replySettings,
      this.lang,
      this.conversationId,
      this.createdAt,
      this.referencedTweets,
      this.geo});

  Tweets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    publicMetrics = json['public_metrics'] != null
        ? PublicMetrics.fromJson(json['public_metrics'])
        : null;
    text = json['text'];
    authorId = json['author_id'];
    possiblySensitive = json['possibly_sensitive'];
    replySettings = json['reply_settings'];
    lang = json['lang'];
    conversationId = json['conversation_id'];
    createdAt = json['created_at'];
    if (json['referenced_tweets'] != null) {
      referencedTweets = <ReferencedTweets>[];
      json['referenced_tweets'].forEach((v) {
        referencedTweets!.add(ReferencedTweets.fromJson(v));
      });
    }
    geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['source'] = source;
    if (publicMetrics != null) {
      data['public_metrics'] = publicMetrics!.toJson();
    }
    data['text'] = text;
    data['author_id'] = authorId;
    data['possibly_sensitive'] = possiblySensitive;
    data['reply_settings'] = replySettings;
    data['lang'] = lang;
    data['conversation_id'] = conversationId;
    data['created_at'] = createdAt;
    if (referencedTweets != null) {
      data['referenced_tweets'] =
          referencedTweets!.map((v) => v.toJson()).toList();
    }
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }
}

class Geo {
  String? placeId;

  Geo({this.placeId});

  Geo.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['place_id'] = placeId;
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