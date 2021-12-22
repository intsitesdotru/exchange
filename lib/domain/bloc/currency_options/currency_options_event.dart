part of 'currency_options_bloc.dart';

abstract class CurrencyOptionsEvent extends Equatable {
  const CurrencyOptionsEvent();
}

class CurrencyOptionsByDefaultEvent extends CurrencyOptionsEvent {
  final List<String> sortingAbbreviationList;

  const CurrencyOptionsByDefaultEvent({
    required this.sortingAbbreviationList,
  });

  @override
  List<Object?> get props => [sortingAbbreviationList];
}

class CurrencyOptionsSetTempOptionsEvent extends CurrencyOptionsEvent {
  final List<CurrencyOptions>? tempCurrenciesOptionsSortingList;

  const CurrencyOptionsSetTempOptionsEvent(
    this.tempCurrenciesOptionsSortingList,
  );

  @override
  List<Object?> get props => [tempCurrenciesOptionsSortingList];
}

class CurrencyOptionsSaveOptionsEvent extends CurrencyOptionsEvent {
  const CurrencyOptionsSaveOptionsEvent();

  @override
  List<Object?> get props => [];
}
