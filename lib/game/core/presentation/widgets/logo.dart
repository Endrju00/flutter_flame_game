import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Game made by',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'PixelifySans',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(
          'assets/logo-white.svg',
          height: 32,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
