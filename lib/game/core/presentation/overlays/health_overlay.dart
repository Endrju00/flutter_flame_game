import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../features/player/bloc/health/health_bloc.dart';

class HealthOverlay extends StatelessWidget {
  const HealthOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 32, left: 32),
      child: BlocBuilder<HealthBloc, HealthState>(
        bloc: sl<HealthBloc>(),
        builder: (context, state) {
          return SizedBox(
            height: 48,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: max(0, state.hearts),
              itemBuilder: (context, index) {
                return Image.asset('assets/images/Menu/heart.png');
              },
            ),
          );
        },
      ),
    );
  }
}
