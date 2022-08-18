import 'package:json_annotation/json_annotation.dart';

part 'global_model.g.dart';

@JsonSerializable()
class GlobalModel {
  int? cases;
  int? deaths;
  int? recovered;

  GlobalModel({this.cases, this.deaths, this.recovered});

  factory GlobalModel.fromJson(Map<String, dynamic> json) {
    return _$GlobalModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GlobalModelToJson(this);
  }
}
