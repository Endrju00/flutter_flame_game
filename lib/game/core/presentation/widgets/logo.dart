import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Andrzej Kapczyński @ 2023',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'PixelifySans',
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
