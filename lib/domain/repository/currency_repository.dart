import 'package:exchange/domain/model/currency.dart';

abstract class CurrencyRepository {
  Future<List<Currency>> getCurrencyList({
    required onDate,
    required periodicity,
  });
}
