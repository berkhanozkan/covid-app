import 'package:covidapp/page/home/model/country_model.dart';
import 'package:covidapp/page/home/model/global_model.dart';
import 'package:covidapp/page/home/service/home_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this.homeService) {
    global = GlobalModel();
    country = CountryModel();

    _fetchGlobal();
    notifyListeners();
  }

  final IHomeService homeService;

  GlobalModel? global;
  String countryname = "";
  CountryModel? country;
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _fetchGlobal() async {
    _changeLoading();
    global = await homeService.fetchGlobal();
    _changeLoading();
  }

  Future<void> fetchCountry(String countryName) async {
    _changeLoading();
    countryname = countryName;
    country = await homeService.fetchCountry(countryName);
    _changeLoading();
  }
}
