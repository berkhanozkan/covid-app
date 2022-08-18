// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      country: json['country'] as String?,
      cases: json['cases'] as int?,
      todayCases: json['todayCases'] as int?,
      deaths: json['deaths'] as int?,
      todayDeaths: json['todayDeaths'] as int?,
      recovered: json['recovered'] as int?,
      active: json['active'] as int?,
      critical: json['critical'] as int?,
      casesPerOneMillion: json['casesPerOneMillion'] as int?,
      deathsPerOneMillion: json['deathsPerOneMillion'] as int?,
      totalTests: json['totalTests'] as int?,
      testsPerOneMillion: json['testsPerOneMillion'] as int?,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'totalTests': instance.totalTests,
      'testsPerOneMillion': instance.testsPerOneMillion,
    };
