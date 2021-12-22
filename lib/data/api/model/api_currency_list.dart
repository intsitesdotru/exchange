import 'package:exchange/data/api/model/api_currency.dart';

class ApiCurrencyList {
  final List<ApiCurrency> currencyList;

  ApiCurrencyList.fromApi(List<dynamic>? listMap)
      : currencyList = listMap == null
            ? List.empty()
            : listMap.map((map) => ApiCurrency.fromApi(map)).toList();
}
