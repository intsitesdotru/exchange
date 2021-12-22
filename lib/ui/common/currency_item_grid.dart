import 'package:flutter/material.dart';

class CurrencyItemGrid extends StatelessWidget {
  const CurrencyItemGrid({
    Key? key,
    required this.title,
    required this.subtitle,
    this.rateList,
    this.toggleWidget,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final List<String>? rateList;
  final Widget? toggleWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        if (rateList != null) ..._mapWidgetsToRates(rateList),
        if (toggleWidget != null)
          Expanded(
            flex: 1,
            child: toggleWidget!,
          ),
      ],
    );
  }
}

_mapWidgetsToRates(rateList) {
  return rateList
      .map((e) => Expanded(
            flex: 1,
            child: Text(
              '$e',
              textAlign: TextAlign.end,
            ),
          ))
      .toList();
}
