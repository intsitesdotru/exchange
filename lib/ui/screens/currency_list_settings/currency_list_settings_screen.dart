import 'package:exchange/ui/screens/currency_list_settings/currency_list_settings_app_bar.dart';
import 'package:exchange/ui/screens/currency_list_settings/currency_list_settings_view.dart';
import 'package:flutter/material.dart';

class CurrencyListSettingsScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const CurrencyListSettingsScreen(),
    );
  }

  const CurrencyListSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CurrencyListSettingsAppBar(title: 'Settings'),
      body: CurrencyListSettingsView(),
    );
  }
}
