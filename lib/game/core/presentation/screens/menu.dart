import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../injection_container.dart';
import '../../../features/benchmark/bloc/benchmark_bloc.dart';
import '../widgets/pixel_button.dart';
import 'game_play.dart';

void lauchDeveloperSite() async {
  if (!await launchUrl(Uri.parse('https://github.com/Endrju00'))) return;
}

class Menu extends StatelessWidget {
  const Menu({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211F30),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Pixel Adventure',
              textAlign: TextAlign.center,
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
            const Spacer(),
            InkWell(
              onTap: lauchDeveloperSite,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 320),
                  child: Row(
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
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4)
          ],
        ),
      ),
    );
  }
}
