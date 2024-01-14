import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  HealthBloc() : super(HealthState.initial()) {
    on<DecreaseHealthEvent>((event, emit) {
      emit(state.copyWith(hearts: max(0, state.hearts - 1)));
    });
    on<ResetHealthEvent>((event, emit) {
      emit(state.copyWith(hearts: 3));
    });
  }
}
