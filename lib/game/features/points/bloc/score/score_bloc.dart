import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreState.initial()) {
    on<IncrementScoreEvent>((event, emit) {
      emit(state.copyWith(score: state.score + 1));
    });
    on<ResetScoreEvent>((event, emit) {
      emit(state.copyWith(score: 0));
    });
  }
}
