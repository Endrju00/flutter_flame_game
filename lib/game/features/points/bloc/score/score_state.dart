part of 'score_bloc.dart';

class ScoreState extends Equatable {
  final int score;

  const ScoreState({
    required this.score,
  });

  factory ScoreState.initial() => const ScoreState(score: 0);

  @override
  List<Object> get props => [score];

  ScoreState copyWith({
    int? score,
  }) {
    return ScoreState(
      score: score ?? this.score,
    );
  }
}
