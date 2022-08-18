import 'package:flutter/material.dart';

class GlobalStatisticCard extends StatelessWidget {
  const GlobalStatisticCard({Key? key, required String title, required int? value, required Color colorm})
      : _title = title,
        _value = value,
        _colorm = colorm,
        super(key: key);

  final String _title;
  final int? _value;
  final Color _colorm;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 140,
      // height: MediaQuery.of(context).size.width * 0.1,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _title,
            style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          _value.toString(),
          style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold, color: _colorm),
        ),
      ]),
    );
  }
}
