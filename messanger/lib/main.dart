import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(Messenger());

class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.white, // like yellow color
      ),
      home: HomeScreen(),
      // home: SideBarLayout(),
    );
  }
}
