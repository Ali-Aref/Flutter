import 'package:flutter/material.dart';
import 'package:happytime/screens/home.dart';

void main() => runApp(HappyTime());

class HappyTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
