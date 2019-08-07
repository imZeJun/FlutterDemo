// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Today _$TodayFromJson(Map<String, dynamic> json) {
  return Today(
      (json['category'] as List)?.map((e) => e as String)?.toList(),
      json['error'] as bool,
      (json['results'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(
            k,
            (e as List)
                ?.map((e) => e == null
                    ? null
                    : ResultsItem.fromJson(e as Map<String, dynamic>))
                ?.toList()),
      ));
}

Map<String, dynamic> _$TodayToJson(Today instance) => <String, dynamic>{
      'category': instance.category,
      'error': instance.error,
      'results': instance.results
    };

ResultsItem _$ResultsItemFromJson(Map<String, dynamic> json) {
  return ResultsItem(
      json['_id'] as String,
      json['desc'] as String,
      json['used'] as bool,
      json['type'] as String,
      json['publishedAt'] as String);
}

Map<String, dynamic> _$ResultsItemToJson(ResultsItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'desc': instance.desc,
      'used': instance.used,
      'type': instance.type,
      'publishedAt': instance.publishedAt
    };
