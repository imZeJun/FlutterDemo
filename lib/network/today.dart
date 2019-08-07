import 'package:json_annotation/json_annotation.dart';

part 'today.g.dart';

@JsonSerializable()
class Today extends Object {

  List<String> category;
  bool error;
  Map<String, List<ResultsItem>> results;

  Today(this.category, this.error, this.results);

  factory Today.fromJson(Map<String, dynamic> json) => _$TodayFromJson(json);
  Map<String, dynamic> toJson() => _$TodayToJson(this);
}

@JsonSerializable()
class ResultsItem extends Object {

  @JsonKey(name : '_id')
  String id;
  String desc;
  bool used;
  String type;
  String publishedAt;

  ResultsItem(this.id, this.desc, this.used, this.type, this.publishedAt);

  factory ResultsItem.fromJson(Map<String, dynamic> json) => _$ResultsItemFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsItemToJson(this);
}