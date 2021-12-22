import 'package:exchange/data/api/api_util.dart';
import 'package:exchange/domain/model/currency.dart';
import 'package:exchange/domain/repository/currency_repository.dart';

class CurrencyDataRepository extends CurrencyRepository {
  final ApiUtil _apiUtil;

  CurrencyDataRepository(this._apiUtil);

  @override
  Future<List<DailyCurrency>> getCurrencyList({
    required DateTime onDate,
    required int periodicity,
  }) {
    return _apiUtil.getDailyCurrencyList(
      onDate: onDate,
      periodicity: periodicity,
    );
  }

  @override
  Future<Map<String, DailyCurrency>> getCurrencyListAsMap({
    required DateTime onDate,
    required int periodicity,
  }) {
    return _apiUtil.getDailyCurrencyListAsMap(
      onDate: onDate,
      periodicity: periodicity,
    );
  }
}
