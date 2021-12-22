import 'package:exchange/domain/model/currency.dart';

abstract class CurrencyRepository {
  Future<List<DailyCurrency>> getCurrencyList({
    required DateTime onDate,
    required int periodicity,
  });

  Future<Map<String, DailyCurrency>> getCurrencyListAsMap({
    required DateTime onDate,
    required int periodicity,
  });
}
