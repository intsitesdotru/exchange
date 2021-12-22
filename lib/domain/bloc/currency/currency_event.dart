part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();
}

class LoadCurrency extends CurrencyEvent {
  final int days;

  const LoadCurrency({required this.days});

  @override
  List<Object?> get props => [days];
}
