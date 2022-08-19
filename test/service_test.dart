import 'package:covidapp/page/home/service/home_service.dart';
import 'package:covidapp/product/service/service_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () async {
    final servce = HomeService(ServiceManager.instance.service);

    final result = await servce.fetchCountry('turkey');

    expect(result, isNotNull);
  });
}
