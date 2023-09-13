// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixabayResponse _$PixabayResponseFromJson(Map<String, dynamic> json) =>
    PixabayResponse(
      json['total'] as int,
      json['totalHits'] as int,
      (json['hits'] as List<dynamic>)
          .map((e) => PixabayItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PixabayResponseToJson(PixabayResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };
