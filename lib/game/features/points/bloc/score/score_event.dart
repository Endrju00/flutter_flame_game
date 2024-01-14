part of 'score_bloc.dart';

@immutable
sealed class ScoreEvent {}

class IncrementScoreEvent extends ScoreEvent {}

class ResetScoreEvent extends ScoreEvent {}
