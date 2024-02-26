import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../features/benchmark/bloc/benchmark_bloc.dart';
import '../widgets/pixel_button.dart';
import 'game_play.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void _navigateToGamePlay(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const GamePlay(),
      ),
    );
  }

  void _enableBenchmark(BuildContext context) {
    sl<BenchmarkBloc>().add(EnableBenchmarkEvent());
    _navigateToGamePlay(context);
  }

  @override
  void initState() {
    super.initState();
    sl<BenchmarkBloc>().add(DisableBenchmarkEvent());
  }

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
              onPressed: () => _navigateToGamePlay(context),
            ),
            const SizedBox(height: 16),
            PixelButton(
              text: 'Benchmark',
              icon: Image.asset(
                'assets/images/Menu/Buttons/Settings.png',
                height: 24,
                width: 24,
                fit: BoxFit.cover,
              ),
              onPressed: () => _enableBenchmark(context),
            ),
          ],
        ),
      ),
    );
  }
}
