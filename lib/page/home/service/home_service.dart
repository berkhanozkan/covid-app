import 'dart:io';

import '../model/country_model.dart';
import '../model/global_model.dart';
import 'package:dio/dio.dart';

abstract class IHomeService {
  final Dio dio;

  IHomeService(this.dio);

  Future<GlobalModel?> fetchGlobal();
  Future<CountryModel?> fetchCountry(String countryName);
}

class HomeService extends IHomeService {
  HomeService(super.dio);

  @override
  Future<GlobalModel?> fetchGlobal() async {
    final response = await dio.get('/all');
    if (response.statusCode == HttpStatus.ok) {
      final jsonResult = response.data;
      if (jsonResult is Map<String, dynamic>) {
        return GlobalModel.fromJson(jsonResult);
      }
    }
    return null;
  }

  @override
  Future<CountryModel?> fetchCountry(String countryName) async {
    final response = await dio.get('/countries/$countryName');
    if (response.statusCode == HttpStatus.ok) {
      final jsonCountry = response.data;
      if (jsonCountry is Map<String, dynamic>) {
        return CountryModel.fromJson(jsonCountry);
      }
    }
    return null;
  }
}
