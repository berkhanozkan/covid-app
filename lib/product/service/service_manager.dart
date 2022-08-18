import 'package:dio/dio.dart';

class ServiceManager {
  ServiceManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'https://coronavirus-19-api.herokuapp.com/'));
  }

  late final Dio _dio;

  static ServiceManager instance = ServiceManager._();

  Dio get service => _dio;
}
