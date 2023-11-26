import 'package:flutter/material.dart';
import 'game/core/presentation/screens/menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Adventure',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF211F30),
      ),
      debugShowCheckedModeBanner: false,
      home: const Menu(),
    );
  }
}
