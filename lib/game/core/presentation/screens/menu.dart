import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../features/points/bloc/score/score_bloc.dart';
import '../widgets/pixel_button.dart';
import 'game_play.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211F30),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pixel Adventure',
              style: TextStyle(
                fontFamily: 'PixelifySans',
                fontSize: 64,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            PixelButton(
              text: 'Play',
              icon: Image.asset(
                'assets/images/Menu/Buttons/Play.png',
                height: 24,
                width: 24,
                fit: BoxFit.cover,
              ),
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => BlocProvider<ScoreBloc>(
                    create: (context) => sl<ScoreBloc>(),
                    child: const GamePlay(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
