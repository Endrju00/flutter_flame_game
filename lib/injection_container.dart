import 'package:flutter_flame_game/game/features/points/bloc/score/score_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton(ScoreBloc());
}
