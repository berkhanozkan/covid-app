import 'package:country_picker/country_picker.dart';
import 'package:covidapp/core/enum/image_path.dart';
import 'package:covidapp/page/home/model/global_model.dart';
import 'package:covidapp/page/home/service/home_service.dart';
import 'package:covidapp/page/home/viewmodel/home_view_model.dart';
import 'package:covidapp/product/service/service_manager.dart';
import 'package:covidapp/product/widget/card/global_statistic_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/page_constants.dart';
import '../../../product/widget/card/introduction_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) =>
          HomeProvider(HomeService(ServiceManager.instance.service)),
      builder: (context, child) {
        return Scaffold(
          appBar: _AppBar(context),
          //    backgroundColor: Colors.white.withOpacity(0.9),
          body: Padding(
            padding: const PagePaddingCustom.allMedium(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _description(context),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  PageTexts.protectYourself,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Divider(),
                const _ProtectionInfo(),
                Text(
                  PageTexts.globalStatistic,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Divider(),
                _GlobalStatistic(
                    context, context.watch<HomeProvider?>()?.global),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.amber.shade600, Colors.amber]),
                        color: Colors.amber,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80))),
                    width: MediaQuery.of(context).size.width,
                    child: _countryWatch(context),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  SingleChildScrollView _GlobalStatistic(
      BuildContext context, GlobalModel? model) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        GlobalStatisticCard(
            colorm: Colors.black,
            title: PageTexts.cases,
            value: model?.cases ?? 0),
        GlobalStatisticCard(
            colorm: Colors.red,
            title: PageTexts.deaths,
            value: model?.deaths ?? 0),
        GlobalStatisticCard(
            colorm: Colors.green,
            title: PageTexts.recovered,
            value: model?.recovered ?? 0)
      ]),
    );
  }

  Column _countryWatch(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const PagePaddingCustom.onlyTopHigh(),
          child: Text(PageTexts.watchCountry,
              style: Theme.of(context).textTheme.headline5),
        ),
        Text(context.watch<HomeProvider>().countryname.isEmpty
            ? 'Not selected Country'
            : context.watch<HomeProvider>().countryname),
        ElevatedButton(
            onPressed: () {
              showCountryPicker(
                context: context,
                onSelect: (value) async {
                  await context.read<HomeProvider>().fetchCountry(value.name);
                },
                countryListTheme: const CountryListThemeData(
                  // Optional. Sets the border radius for the bottomsheet.
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  inputDecoration: InputDecoration(
                    labelText: PageTexts.search,
                    hintText: PageTexts.typeSearch,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              );
            },
            child: const Text(PageTexts.selectCountry)),
        Expanded(
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
                value: (context.watch<HomeProvider>().country?.cases ?? 0)
                    .toDouble(),
                color: Colors.blue,
              ),
              PieChartSectionData(
                value: (context.watch<HomeProvider>().country?.deaths ?? 0)
                    .toDouble(),
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
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ),
        )
      ],
    );
  }

  Container _description(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // color: Colors.white,
          gradient:
              LinearGradient(colors: [Colors.amber, Colors.amber.shade600]),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(children: [
        ImagePath.ic_health.toWidget(height: 200),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lorem ipsum dolor sit.',
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(
                height: 10,
              ),
              Text(' Ut euismod, lectus eu accumsan dignissim, nisl.',
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        )
      ]),
    );
  }

  AppBar _AppBar(BuildContext context) {
    return AppBar(
      actions: [
        context.watch<HomeProvider>().isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.refresh_outlined,
                  color: Colors.black54,
                ),
                tooltip: PageTexts.refreshData,
              )
      ],
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Covid Statistics',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        Text('Stay Healthy',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w300))
      ]),
    );
  }
}

class _ProtectionInfo extends StatelessWidget {
  const _ProtectionInfo({
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
