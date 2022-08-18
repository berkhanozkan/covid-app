// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalModel _$GlobalModelFromJson(Map<String, dynamic> json) => GlobalModel(
      cases: json['cases'] as int?,
      deaths: json['deaths'] as int?,
      recovered: json['recovered'] as int?,
    );

Map<String, dynamic> _$GlobalModelToJson(GlobalModel instance) =>
    <String, dynamic>{
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
    };
