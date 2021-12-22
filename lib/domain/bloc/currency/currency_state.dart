part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyLoading extends CurrencyState {}

class CurrencySuccessLoaded extends CurrencyState {
  final List<Map<String, DailyCurrency>> currencyMapsList;
  final List<DateTime> daysList;

  const CurrencySuccessLoaded({
    required this.currencyMapsList,
    required this.daysList,
  });

  @override
  List<Object> get props => [currencyMapsList, daysList];
}

class CurrencyErrorLoaded extends CurrencyState {}
