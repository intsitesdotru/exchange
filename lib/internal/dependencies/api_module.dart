import 'package:exchange/data/api/api_util.dart';
import 'package:exchange/data/api/service/currency_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    return _apiUtil ??= ApiUtil(CurrencyService());
  }
}
