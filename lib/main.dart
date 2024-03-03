import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'app.dart';

Future<void> _setLandscape() async {
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setLandscape();
  di.init();
  runApp(const MyApp());
}
