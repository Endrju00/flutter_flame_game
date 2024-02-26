import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'benchmark_event.dart';
part 'benchmark_state.dart';

class BenchmarkBloc extends Bloc<BenchmarkEvent, BenchmarkState> {
  BenchmarkBloc() : super(BenchmarkState.initial()) {
    on<EnableBenchmarkEvent>((event, emit) {
      emit(state.copyWith(isRunning: true));
    });
    on<DisableBenchmarkEvent>((event, emit) {
      emit(state.copyWith(isRunning: false));
    });
  }
}
