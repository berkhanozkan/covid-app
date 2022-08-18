import 'package:flutter/material.dart';

enum ImagePath { ic_distance, ic_washhands, ic_wearmask, ic_health }

extension ImagePathExtension on ImagePath {
  String path() => 'assets/images/$name.png';

  Widget toWidget({double height = 20}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}
