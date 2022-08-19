import 'page/home/view/home_view.dart';
import 'product/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: LightTheme().theme,
      home: const HomeView(),
    );
  }
}
