class TweetAmount {
  List<Data>? data;
  Meta? meta;

  TweetAmount({this.data, this.meta});

  TweetAmount.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? end;
  String? start;
  int? tweetCount;

  Data({this.end, this.start, this.tweetCount});

  Data.fromJson(Map<String, dynamic> json) {
    end = json['end'];
    start = json['start'];
    tweetCount = json['tweet_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['end'] = end;
    data['start'] = start;
    data['tweet_count'] = tweetCount;
    return data;
  }
}

class Meta {
  int? totalTweetCount;

  Meta({this.totalTweetCount});

  Meta.fromJson(Map<String, dynamic> json) {
    totalTweetCount = json['total_tweet_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_tweet_count'] = totalTweetCount;
    return data;
  }
}
