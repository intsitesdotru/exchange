import 'package:intl/intl.dart';

class GetDailyCurrencyListBody {
  final DateTime onDate;
  final int periodicity;

  const GetDailyCurrencyListBody({
    required this.onDate,
    required this.periodicity,
  });

  Map<String, dynamic> toApi() {
    return {
      'ondate': DateFormat("yyyy-MM-dd").format(onDate),
      'periodicity': periodicity,
    };
  }
}
