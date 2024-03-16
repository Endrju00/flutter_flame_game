import 'package:flutter/material.dart';

import '../widgets/logo.dart';
import 'menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _delayedNavigation() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Menu()),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _delayedNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  'Pixel Adventure',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PixelifySans',
                    fontSize: 64,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Hero(
              tag: 'label',
              child: Logo(),
            ),
          ],
        ),
      ),
    );
  }
}
