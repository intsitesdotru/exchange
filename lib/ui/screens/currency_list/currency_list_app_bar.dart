import 'package:exchange/domain/bloc/currency/currency_bloc.dart';
import 'package:exchange/ui/screens/currency_list_settings/currency_list_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CurrencyListAppBar({
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
        BlocBuilder<CurrencyBloc, CurrencyState>(
          builder: (context, state) {
            return Visibility(
              visible: state is CurrencySuccessLoaded,
              child: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context)
                      .push(CurrencyListSettingsScreen.route());
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
