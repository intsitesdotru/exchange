import 'package:collection/collection.dart';
import 'package:exchange/domain/bloc/currency/currency_bloc.dart';
import 'package:exchange/domain/bloc/currency_options/currency_options_bloc.dart';
import 'package:exchange/domain/model/currency.dart';
import 'package:exchange/ui/common/currency_item_grid.dart';
import 'package:exchange/ui/screens/currency_list/currency_list_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CurrencyListScreen extends StatelessWidget {
  const CurrencyListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CurrencyListAppBar(
        title: 'Exchange Rates',
      ),
      body: BlocBuilder<CurrencyOptionsBloc, CurrencyOptionsState>(
        builder: (context, state) {
          final List<String> visibleCurrencyAbbreviations =
              state.visibleCurrencyAbbreviations;
          return BlocBuilder<CurrencyBloc, CurrencyState>(
            builder: (context, state) {
              if (state is CurrencyLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is CurrencyErrorLoaded) {
                return const Center(
                  child: Text('Не удалось получить курсы валют'),
                );
              }

              final List<Map<String, DailyCurrency>> currencyMapsList =
                  (state as CurrencySuccessLoaded).currencyMapsList;
              final Map<String, DailyCurrency> currencyListAsMap =
                  currencyMapsList[0];

              final List<String> columnTitleList = state.daysList
                  .map((e) => DateFormat('dd.MM.yy').format(e))
                  .toList();

              return Column(
                children: [
                  ListTile(
                    title: CurrencyItemGrid(
                      title: '',
                      subtitle: '',
                      rateList: columnTitleList,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ...visibleCurrencyAbbreviations.mapIndexed((index, e) {
                          final DailyCurrency? currency = currencyListAsMap[e];
                          final List<String> currencyRatesList =
                              currencyMapsList
                                  .map((currencyListAsMap) =>
                                      '${currencyListAsMap[e]?.rate}')
                                  .toList();
                          return ListTile(
                            key: Key('$index'),
                            title: CurrencyItemGrid(
                              title: '${currency?.abbreviation}',
                              subtitle: '${currency?.scale} ${currency?.name}',
                              rateList: [...currencyRatesList],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
