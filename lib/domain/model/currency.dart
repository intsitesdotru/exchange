import 'package:equatable/equatable.dart';

class DailyCurrency extends Equatable {
  final String id;
  final DateTime? date;
  final String abbreviation;
  final int scale;
  final String name;
  final double rate;

  const DailyCurrency({
    required this.id,
    required this.date,
    required this.abbreviation,
    required this.scale,
    required this.name,
    required this.rate,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        abbreviation,
        scale,
        name,
        rate,
      ];
}
