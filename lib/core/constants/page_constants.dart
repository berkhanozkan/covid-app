import 'package:flutter/cupertino.dart';

class PagePaddingCustom extends EdgeInsets {
  const PagePaddingCustom.onlyTopHigh() : super.only(top: 10);
  const PagePaddingCustom.allMedium() : super.all(10);
}

class PageTexts {
  static const refreshData = 'Refresh Data';
  static const selectCountry = 'Click to Select Country';
  static const watchCountry = 'Watch Your Country';
  static const cases = 'Cases';
  static const deaths = 'Deaths';
  static const recovered = 'Recovered';
  static const typeSearch = 'Type to search';
  static const search = 'Search';
  static const globalStatistic = 'Global Statistic';
  static const protectYourself = 'Protect Yourself';
}
