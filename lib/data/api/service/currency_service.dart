import 'package:dio/dio.dart';
import 'package:exchange/data/api/model/api_currency.dart';
import 'package:exchange/data/api/model/api_currency_list.dart';
import 'package:exchange/data/api/request/get_daily_currency_list_body.dart';

class CurrencyService {
  static const _BASE_URL = 'https://www.nbrb.by/api/exrates';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<List<ApiCurrency>> getDailyCurrencyList(
    GetDailyCurrencyListBody body,
  ) async {
    final response = await _dio.get(
      '/rates',
      queryParameters: body.toApi(),
    );

    return ApiCurrencyList.fromApi(response.data).currencyList;
  }
}
