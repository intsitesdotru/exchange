import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange/domain/model/currency.dart';
import 'package:exchange/domain/repository/currency_repository.dart';

part 'currency_event.dart';

part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc({required currencyRepository})
      : _currencyRepository = currencyRepository,
        super(CurrencyLoading());

  final CurrencyRepository _currencyRepository;

  @override
  Stream<CurrencyState> mapEventToState(
    CurrencyEvent event,
  ) async* {
    if (event is LoadCurrency) {
      yield* _mapLoadCurrencyToState(event);
    }
  }

  Stream<CurrencyState> _mapLoadCurrencyToState(LoadCurrency event) async* {
    yield CurrencyLoading();
    try {
      int days = event.days;
      final List<DateTime> daysList = [];
      final List<Map<String, DailyCurrency>> currencyMapsList = [];
      final DateTime startDateTime =
          DateTime.now().add(const Duration(days: 1));

      for (int i = 0; i < days; i++) {
        if (i > 1 && currencyMapsList.isEmpty) {
          throw Exception();
        }

        final DateTime onDate = startDateTime.add(Duration(days: -i));
        final currencyListAsMap =
            await _currencyRepository.getCurrencyListAsMap(
          onDate: onDate,
          periodicity: 0,
        );

        if (currencyListAsMap.isNotEmpty) {
          daysList.add(onDate);
          currencyMapsList.add(currencyListAsMap);
        } else {
          days++;
        }
      }

      yield CurrencySuccessLoaded(
        currencyMapsList: currencyMapsList.reversed.toList(),
        daysList: daysList.reversed.toList(),
      );
    } on Exception {
      yield CurrencyErrorLoaded();
    }
  }
}
