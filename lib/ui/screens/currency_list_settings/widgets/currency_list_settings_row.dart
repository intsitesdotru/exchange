import 'package:exchange/domain/model/currency.dart';
import 'package:exchange/domain/model/currency_options.dart';
import 'package:exchange/ui/common/currency_item_grid.dart';
import 'package:flutter/material.dart';

class CurrencyListSettingsRow extends StatelessWidget {
  const CurrencyListSettingsRow({
    Key? key,
    required this.currency,
    required this.currencyOptions,
    required this.onChanged,
  }) : super(key: key);

  final DailyCurrency? currency;
  final CurrencyOptions currencyOptions;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return CurrencyItemGrid(
      title: currencyOptions.currencyAbbreviation,
      subtitle: '${currency?.scale} ${currency?.name}',
      toggleWidget: Switch(
        value: currencyOptions.visibility,
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}
