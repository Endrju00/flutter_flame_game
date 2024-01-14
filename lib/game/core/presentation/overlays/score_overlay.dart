import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../features/points/bloc/score/score_bloc.dart';

class ScoreOverlay extends StatelessWidget {
  const ScoreOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 32, right: 32),
      child: BlocBuilder<ScoreBloc, ScoreState>(
        bloc: sl<ScoreBloc>(),
        builder: (context, state) {
          return Text(
            'SCORE: ${state.score}',
            style: const TextStyle(
              fontFamily: 'PixelifySans',
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          );
        },
      ),
    );
  }
}
