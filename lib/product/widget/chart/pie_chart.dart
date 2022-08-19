import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../page/home/viewmodel/home_view_model.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PieChart(
        PieChartData(sections: [
          PieChartSectionData(
            title: '',
            badgePositionPercentageOffset: 2,
            badgeWidget: Container(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Text(
                  'Total Cases\n${context.watch<HomeProvider>().country?.cases ?? 0}',
                  style: const TextStyle(color: Colors.white)),
            ),
            value:
                (context.watch<HomeProvider>().country?.cases ?? 0).toDouble(),
            color: Colors.blue,
          ),
          PieChartSectionData(
            value:
                (context.watch<HomeProvider>().country?.deaths ?? 0).toDouble(),
            badgePositionPercentageOffset: 2,
            badgeWidget: Container(
              decoration: const BoxDecoration(color: Colors.red),
              child: Text(
                  'Total Deaths\n${context.watch<HomeProvider>().country?.deaths ?? 0}',
                  style: const TextStyle(color: Colors.white)),
            ),
            title: '',
            color: Colors.red,
          ),
        ]
            // read about it in the PieChartData section
            ),
        swapAnimationDuration: const Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
    );
  }
}
