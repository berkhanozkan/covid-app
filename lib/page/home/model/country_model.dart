import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  String? country;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? totalTests;
  int? testsPerOneMillion;

  CountryModel(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.totalTests,
      this.testsPerOneMillion});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return _$CountryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CountryModelToJson(this);
  }
}
