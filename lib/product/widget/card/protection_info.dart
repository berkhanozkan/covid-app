import 'package:flutter/material.dart';

import '../../../core/enum/image_path.dart';
import 'introduction_card.dart';

class ProtectionInfo extends StatelessWidget {
  const ProtectionInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
        IntroductionCard(
            imageName: ImagePath.ic_distance, title: 'Distance', height: 90),
        IntroductionCard(
            imageName: ImagePath.ic_washhands,
            title: 'Wash Your Hands',
            height: 90),
        IntroductionCard(
            imageName: ImagePath.ic_wearmask, title: 'Wear Mask', height: 90),
      ]),
    );
  }
}
