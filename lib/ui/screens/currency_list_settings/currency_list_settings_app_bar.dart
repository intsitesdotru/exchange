import 'package:exchange/domain/bloc/currency_options/currency_options_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyListSettingsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CurrencyListSettingsAppBar({
    Key? key,
    required title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      actions: <Widget>[
        BlocBuilder<CurrencyOptionsBloc, CurrencyOptionsState>(
          builder: (context, state) {
            return Visibility(
              visible: state.tempCurrenciesOptionsSortingList.isNotEmpty,
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  context.read<CurrencyOptionsBloc>().add(
                        const CurrencyOptionsSaveOptionsEvent(),
                      );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
