// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_fact_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberFactResp _$NumberFactRespFromJson(Map<String, dynamic> json) =>
    NumberFactResp(
      text: json['text'] as String?,
      number: (json['number'] as num?)?.toInt(),
      found: json['found'] as bool?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NumberFactRespToJson(NumberFactResp instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': instance.number,
      'found': instance.found,
      'type': instance.type,
    };
