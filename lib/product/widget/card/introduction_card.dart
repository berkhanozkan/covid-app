import 'package:flutter/material.dart';

import '../../../core/enum/image_path.dart';

class IntroductionCard extends StatelessWidget {
  const IntroductionCard(
      {Key? key,
      required String title,
      required ImagePath imageName,
      required double height})
      : _title = title,
        _imageName = imageName,
        _height = height,
        super(key: key);
  final ImagePath _imageName;
  final String _title;
  final double _height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 140,
      // height: MediaQuery.of(context).size.width * 0.1,
      child: Column(children: [
        _imageName.toWidget(height: _height),
        Text(_title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
