import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:exchange/domain/model/currency_options.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'currency_options_event.dart';

part 'currency_options_state.dart';

class CurrencyOptionsBloc
    extends HydratedBloc<CurrencyOptionsEvent, CurrencyOptionsState> {
  CurrencyOptionsBloc() : super(const CurrencyOptionsState());

  @override
  Stream<CurrencyOptionsState> mapEventToState(
    CurrencyOptionsEvent event,
  ) async* {
    if (event is CurrencyOptionsByDefaultEvent) {
      yield* _mapCurrencyOptionsByDefaultEventEventToState(event);
    } else if (event is CurrencyOptionsSetTempOptionsEvent) {
      yield* _mapCurrencyOptionsSetTempOptionsEventToState(event);
    } else if (event is CurrencyOptionsSaveOptionsEvent) {
      yield* _mapCurrencyOptionsSaveOptionsEventToState();
    }
  }

  Stream<CurrencyOptionsState> _mapCurrencyOptionsByDefaultEventEventToState(
    CurrencyOptionsByDefaultEvent event,
  ) async* {
    final Set<String> currentAbbreviationsSet = state
        .currenciesOptionsSortingList
        .map((e) => e.currencyAbbreviation)
        .toSet();

    final Set<String> addedAbbreviationsSet = event.sortingAbbreviationList
        .toSet()
        .difference(currentAbbreviationsSet);

    final List<CurrencyOptions> addedCurrencyOptions = addedAbbreviationsSet
        .map((e) => CurrencyOptions(currencyAbbreviation: e))
        .toList();

    yield state.copyWith(
      currenciesOptionsSortingList: [
        ...state.currenciesOptionsSortingList,
        ...addedCurrencyOptions,
      ],
    );
  }

  Stream<CurrencyOptionsState> _mapCurrencyOptionsSetTempOptionsEventToState(
    CurrencyOptionsSetTempOptionsEvent event,
  ) async* {
    yield state.copyWith(
      tempCurrenciesOptionsSortingList: event.tempCurrenciesOptionsSortingList,
    );
  }

  Stream<CurrencyOptionsState>
      _mapCurrencyOptionsSaveOptionsEventToState() async* {
    yield state.copyWith(
      currenciesOptionsSortingList: [...state.tempCurrenciesOptionsSortingList],
      tempCurrenciesOptionsSortingList: [],
    );
  }

  @override
  CurrencyOptionsState? fromJson(Map<String, dynamic> json) {
    return CurrencyOptionsState(
      currenciesOptionsSortingList:
          (json['currenciesOptionsSortingList'] as List)
              .map((e) => CurrencyOptions.fromJson(e))
              .toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(CurrencyOptionsState state) {
    return {
      'currenciesOptionsSortingList': state.currenciesOptionsSortingList,
    };
  }
}
