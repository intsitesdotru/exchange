import 'package:exchange/data/api/model/api_currency.dart';
import 'package:exchange/domain/model/currency.dart';

class CurrencyMapper {
  static DailyCurrency fromApi(ApiCurrency apiCurrency) {
    return DailyCurrency(
      id: apiCurrency.curID.toString(),
      date: DateTime.tryParse(apiCurrency.date),
      abbreviation: apiCurrency.curAbbreviation,
      scale: apiCurrency.curScale.toInt(),
      name: apiCurrency.curName,
      rate: apiCurrency.curOfficialRate.toDouble(),
    );
  }
}
