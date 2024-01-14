import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'app.dart';

Future<void> _setPortrait() async {
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setPortrait();
  di.init();
  runApp(const MyApp());
}
