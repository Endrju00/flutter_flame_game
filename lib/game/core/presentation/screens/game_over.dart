import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../features/player/bloc/health/health_bloc.dart';
import '../../../features/points/bloc/score/score_bloc.dart';
import '../../../pixel_adventure.dart';
import '../widgets/pixel_button.dart';
import 'menu.dart';

class GameOverScreen extends StatelessWidget {
  final PixelAdventure game;
  final bool isPlayerDead;

  const GameOverScreen({
    super.key,
    required this.game,
    required this.isPlayerDead,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211F30),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isPlayerDead
                ? const Text(
                    'Game over',
                    style: TextStyle(
                      fontFamily: 'PixelifySans',
                      fontSize: 64,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontFamily: 'PixelifySans',
                      fontSize: 64,
                      color: Colors.white,
                    ),
                  ),
            const SizedBox(height: 16),
            isPlayerDead
                ? const Text(
                    'You have lost all your hearts.',
                    style: TextStyle(
                      fontFamily: 'PixelifySans',
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : const Text(
                    'You have completed the game.',
                    style: TextStyle(
                      fontFamily: 'PixelifySans',
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
            BlocBuilder<ScoreBloc, ScoreState>(
              bloc: sl<ScoreBloc>(),
              builder: (context, state) {
                
                return Text(
                  'Score: ${state.score}',
                  style: const TextStyle(
                    fontFamily: 'PixelifySans',
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            PixelButton(
              text: 'Play again',
              icon: Image.asset(
                'assets/images/Menu/Buttons/Restart.png',
                height: 24,
                width: 24,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                sl<ScoreBloc>().add(ResetScoreEvent());
                sl<HealthBloc>().add(ResetHealthEvent());
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Menu(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
