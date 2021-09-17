import 'package:dzair_data_usage/daira.dart';
import 'package:dzair_data_usage/dzair.dart';
import 'package:dzair_data_usage/langs.dart';
import 'package:dzair_data_usage/wilaya.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    Dzair dzair = Dzair();
    List<Wilaya> result = dzair.getWilayat();
    result.forEach((element) {
      print(element.getWilayaCode());
    });
    print(result.length);
  });
}
