import 'package:climaone/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climaone/screens/loading_screen.dart';
import 'package:climaone/screens/city_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
