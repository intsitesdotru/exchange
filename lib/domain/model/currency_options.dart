import 'package:equatable/equatable.dart';

class CurrencyOptions extends Equatable {
  final String currencyAbbreviation;
  final bool visibility;

  const CurrencyOptions({
    required this.currencyAbbreviation,
    this.visibility = false,
  });

  CurrencyOptions copyWith({
    String? currencyAbbreviation,
    bool? visibility,
  }) {
    return CurrencyOptions(
      currencyAbbreviation: currencyAbbreviation ?? this.currencyAbbreviation,
      visibility: visibility ?? this.visibility,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currencyAbbreviation': currencyAbbreviation,
      'visibility': visibility,
    };
  }

  factory CurrencyOptions.fromJson(Map<String, dynamic> json) {
    return CurrencyOptions(
      currencyAbbreviation: json['currencyAbbreviation'],
      visibility: json['visibility'],
    );
  }

  @override
  List<Object?> get props => [currencyAbbreviation, visibility];
}
