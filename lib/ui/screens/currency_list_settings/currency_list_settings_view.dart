import 'package:collection/collection.dart';
import 'package:exchange/domain/bloc/currency/currency_bloc.dart';
import 'package:exchange/domain/bloc/currency_options/currency_options_bloc.dart';
import 'package:exchange/domain/model/currency.dart';
import 'package:exchange/domain/model/currency_options.dart';
import 'package:exchange/ui/screens/currency_list_settings/widgets/currency_list_settings_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyListSettingsView extends StatelessWidget {
  const CurrencyListSettingsView({Key? key}) : super(key: key);

  _onChangeVisibility(
    BuildContext context,
    List<CurrencyOptions> listOptions,
    int index,
  ) {
    final List<CurrencyOptions> changedOptionsList = [...listOptions];
    changedOptionsList[index] = changedOptionsList[index].copyWith(
      visibility: !changedOptionsList[index].visibility,
    );

    context.read<CurrencyOptionsBloc>().add(
          CurrencyOptionsSetTempOptionsEvent(
            changedOptionsList,
          ),
        );
  }

  _onReorder(
    BuildContext context,
    List<CurrencyOptions> listOptions,
    int oldIndex,
    int newIndex,
  ) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final List<CurrencyOptions> changedOptionsList = [...listOptions];
    final CurrencyOptions item = changedOptionsList.removeAt(oldIndex);
    changedOptionsList.insert(newIndex, item);

    context.read<CurrencyOptionsBloc>().add(
          CurrencyOptionsSetTempOptionsEvent(
            changedOptionsList,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        final Map<String, DailyCurrency> currencyListAsMap =
            (state as CurrencySuccessLoaded).currencyMapsList[0];

        return BlocBuilder<CurrencyOptionsBloc, CurrencyOptionsState>(
          builder: (context, state) {
            final List<CurrencyOptions> listOptions =
                state.tempCurrenciesOptionsSortingList.isNotEmpty
                    ? state.tempCurrenciesOptionsSortingList
                    : state.currenciesOptionsSortingList;

            return ReorderableListView(
              onReorder: (int oldIndex, int newIndex) =>
                  _onReorder(context, listOptions, oldIndex, newIndex),
              children: [
                ...listOptions.mapIndexed((index, e) {
                  return ListTile(
                    key: Key('$index'),
                    title: CurrencyListSettingsRow(
                      currency: currencyListAsMap[e.currencyAbbreviation],
                      currencyOptions: e,
                      onChanged: () =>
                          _onChangeVisibility(context, listOptions, index),
                    ),
                    trailing: const Icon(Icons.menu),
                  );
                }),
              ],
            );
          },
        );
      },
    );
  }
}
