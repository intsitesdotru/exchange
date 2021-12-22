part of 'currency_options_bloc.dart';

class CurrencyOptionsState extends Equatable {
  static const List<CurrencyOptions> _sortingAbbreviationListDefault = [
    CurrencyOptions(
      currencyAbbreviation: 'USD',
      visibility: true,
    ),
    CurrencyOptions(
      currencyAbbreviation: 'EUR',
      visibility: true,
    ),
    CurrencyOptions(
      currencyAbbreviation: 'RUB',
      visibility: true,
    ),
  ];
  final List<CurrencyOptions> currenciesOptionsSortingList;
  final List<CurrencyOptions> tempCurrenciesOptionsSortingList;

  const CurrencyOptionsState({
    this.currenciesOptionsSortingList = _sortingAbbreviationListDefault,
    this.tempCurrenciesOptionsSortingList = const [],
  });

  List<String> get visibleCurrencyAbbreviations => currenciesOptionsSortingList
      .where((e) => e.visibility)
      .map((e) => e.currencyAbbreviation)
      .toList();

  CurrencyOptionsState copyWith({
    List<CurrencyOptions>? currenciesOptionsSortingList,
    List<CurrencyOptions>? tempCurrenciesOptionsSortingList,
  }) {
    return CurrencyOptionsState(
      currenciesOptionsSortingList:
          currenciesOptionsSortingList ?? this.currenciesOptionsSortingList,
      tempCurrenciesOptionsSortingList: tempCurrenciesOptionsSortingList ??
          this.tempCurrenciesOptionsSortingList,
    );
  }

  @override
  List<Object?> get props => [
        currenciesOptionsSortingList,
        tempCurrenciesOptionsSortingList,
      ];
}
