import 'package:hive/hive.dart';
part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  String? tweet;
  @HiveField(1)
  String? link;

  Transaction({this.tweet, this.link});

  // String? get tweets => tweet;
  // String? get created => createdAt;
}
