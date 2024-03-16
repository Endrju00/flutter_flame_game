import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Opacity(
        opacity: 0.1,
        child: Padding(
          padding: EdgeInsets.only(left: size.width * 0.2),
          child: SvgPicture.asset(
            'assets/logo-white.svg',
            height: size.height * 0.5,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
