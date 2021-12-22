import 'package:exchange/data/repository/currency_data_repository.dart';
import 'package:exchange/domain/repository/currency_repository.dart';
import 'package:exchange/internal/dependencies/api_module.dart';

class RepositoryModule {
  static CurrencyRepository? _currencyRepository;

  static CurrencyRepository currencyRepository() {
    return _currencyRepository ??= CurrencyDataRepository(ApiModule.apiUtil());
  }
}
