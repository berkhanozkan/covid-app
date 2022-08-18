import 'package:covidapp/page/home/model/country_model.dart';
import 'package:covidapp/page/home/model/global_model.dart';
import 'package:covidapp/page/home/service/home_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this.homeService) {
    _fetchGlobal();
    notifyListeners();
  }

  final IHomeService homeService;

  GlobalModel global = GlobalModel();
  CountryModel country = CountryModel();
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> _fetchGlobal() async {
    _changeLoading();
    global = (await homeService.fetchGlobal()) ?? GlobalModel();
    _changeLoading();
  }

  Future<void> _fetchCountry(String countryName) async {
    _changeLoading();
    country = (await homeService.fetchCountry(countryName)) ?? CountryModel();
    _changeLoading();
  }
}
