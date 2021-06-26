import 'package:dzair_data_usage/daira.dart';
import 'package:dzair_data_usage/dzair.dart';
import 'package:dzair_data_usage/langs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    Dzair dzair = Dzair();
    List<Daira> result = dzair.searchDairatByName('mosta', Language.FR);
    result.forEach((element) {
      element.getDairaName(Language.FR);
    });
  });
}
