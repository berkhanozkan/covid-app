import 'package:covidapp/core/enum/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../product/widget/card/introduction_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String dpValue = "tr";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(context),
      //    backgroundColor: Colors.white.withOpacity(0.9),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  // color: Colors.white,
                  gradient: LinearGradient(
                      colors: [Colors.amber, Colors.amber.shade600]),
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
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Protect Yourself',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    IntroductionCard(
                        imageName: ImagePath.ic_distance,
                        title: 'Distance',
                        height: 90),
                    IntroductionCard(
                        imageName: ImagePath.ic_washhands,
                        title: 'Wash Your Hands',
                        height: 90),
                    IntroductionCard(
                        imageName: ImagePath.ic_wearmask,
                        title: 'Wear Mask',
                        height: 90),
                  ]),
            ),
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('Watch Your Country',
                              style: Theme.of(context).textTheme.headline5),
                        ),
                        DropdownButton<String>(
                            value: dpValue,
                            items: const [
                              DropdownMenuItem(
                                value: "tr",
                                child: Text('tr'),
                              ),
                              DropdownMenuItem(value: "en", child: Text('en')),
                              DropdownMenuItem(
                                value: "usa",
                                child: Text('usa'),
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                dpValue = value!;
                              });
                            })
                      ])),
            )
          ],
        ),
      ),
    );
  }

  AppBar _AppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.refresh_outlined,
            color: Colors.black54,
          ),
          tooltip: 'Refresh Data',
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
