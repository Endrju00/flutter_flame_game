import 'package:flutter/material.dart';

import 'menu.dart';

class InterstitialAd extends StatefulWidget {
  const InterstitialAd({super.key});

  @override
  State<InterstitialAd> createState() => _InterstitialAdState();
}

class _InterstitialAdState extends State<InterstitialAd> {
  int seconds = 5;

  void _countdown() async {
    for (var i = 1; i <= 5; i++) {
      setState(() => seconds--);
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void _navigateToMenu() async {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Menu(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _countdown());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211F30),
      body: PopScope(
        canPop: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 32,
                    child: InkWell(
                      onTap: seconds > 0 ? null : _navigateToMenu,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 8,
                          left: 24,
                          right: 24,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          seconds > 0 ? 'Skip in $seconds' : 'Skip ad',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'PixelifySans',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    onTap: lauchDeveloperSite,
                    child: Image.asset('assets/interstitial_ad.png'),
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
