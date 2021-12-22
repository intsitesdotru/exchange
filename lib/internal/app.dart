import 'package:exchange/domain/bloc/currency/currency_bloc.dart';
import 'package:exchange/domain/bloc/currency_options/currency_options_bloc.dart';
import 'package:exchange/domain/repository/currency_repository.dart';
import 'package:exchange/internal/dependencies/repository_module.dart';
import 'package:exchange/ui/screens/currency_list/currency_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositoryModule.currencyRepository(),
      child: Builder(builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => CurrencyBloc(
                currencyRepository:
                    RepositoryProvider.of<CurrencyRepository>(context),
              )..add(const LoadCurrency(days: 2)),
            ),
            BlocProvider(create: (_) => CurrencyOptionsBloc()),
          ],
          child: BlocListener<CurrencyBloc, CurrencyState>(
            listenWhen: (_, currentState) =>
                currentState is CurrencySuccessLoaded,
            listener: (BuildContext context, state) {
              BlocProvider.of<CurrencyOptionsBloc>(context).add(
                CurrencyOptionsByDefaultEvent(
                  sortingAbbreviationList: (state as CurrencySuccessLoaded)
                      .currencyMapsList[0]
                      .keys
                      .toList(),
                ),
              );
            },
            child: const AppView(),
          ),
        );
      }),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exchange Rates',
      home: CurrencyListScreen(),
    );
  }
}
