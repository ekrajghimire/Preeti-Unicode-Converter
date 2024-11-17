import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(PreetiUnicodeApp());
}

class PreetiUnicodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preeti-Unicode Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
