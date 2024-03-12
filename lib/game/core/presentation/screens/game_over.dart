import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../features/benchmark/bloc/benchmark_bloc.dart';
import '../../../features/player/bloc/health/health_bloc.dart';
import '../../../features/points/bloc/score/score_bloc.dart';
import '../../../pixel_adventure.dart';
import '../widgets/pixel_button.dart';
import 'interstitial_ad.dart';

class GameOverScreen extends StatelessWidget {
  final PixelAdventure game;
  final bool isPlayerDead;

  const GameOverScreen({
    super.key,
    required this.game,
    required this.isPlayerDead,
  });

  void _restartGame(BuildContext context) {
    sl<ScoreBloc>().add(ResetScoreEvent());
    sl<HealthBloc>().add(ResetHealthEvent());
    sl<BenchmarkBloc>().add(DisableBenchmarkEvent());
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const InterstitialAd(),
      ),
    );
  }

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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PixelifySans',
                      fontSize: 64,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Congratulations!',
                    textAlign: TextAlign.center,
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PixelifySans',
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : const Text(
                    textAlign: TextAlign.center,
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
                  textAlign: TextAlign.center,
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
            BlocBuilder<BenchmarkBloc, BenchmarkState>(
              bloc: sl<BenchmarkBloc>(),
              builder: (context, benchmark) {
                if (benchmark.isRunning) {
                  return PixelButton(
                    text: 'Menu',
                    icon: Image.asset(
                      'assets/images/Menu/Buttons/Previous.png',
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () => _restartGame(context),
                  );
                }
                return PixelButton(
                  text: 'Play again',
                  icon: Image.asset(
                    'assets/images/Menu/Buttons/Restart.png',
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                  onPressed: () => _restartGame(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
