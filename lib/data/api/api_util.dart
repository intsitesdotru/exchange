import 'package:exchange/data/api/request/get_daily_currency_list_body.dart';
import 'package:exchange/data/api/service/currency_service.dart';
import 'package:exchange/data/mapper/currency_mapper.dart';
import 'package:exchange/domain/model/currency.dart';

class ApiUtil {
  final CurrencyService _currencyService;

  ApiUtil(this._currencyService);

  Future<List<DailyCurrency>> getDailyCurrencyList({
    required DateTime onDate,
    required int periodicity,
  }) async {
    final body = GetDailyCurrencyListBody(
      onDate: onDate,
      periodicity: periodicity,
    );

    final result = await _currencyService.getDailyCurrencyList(body);

    return result.map((e) => CurrencyMapper.fromApi(e)).toList();
  }

  Future<Map<String, DailyCurrency>> getDailyCurrencyListAsMap({
    required DateTime onDate,
    required int periodicity,
  }) async {
    final body = GetDailyCurrencyListBody(
      onDate: onDate,
      periodicity: periodicity,
    );
    Map<String, DailyCurrency> currencyMap = {};
    final result = await _currencyService.getDailyCurrencyList(body);

    for (var e in result) {
      final DailyCurrency currency = CurrencyMapper.fromApi(e);
      currencyMap[currency.abbreviation] = currency;
    }

    return currencyMap;
  }
}
