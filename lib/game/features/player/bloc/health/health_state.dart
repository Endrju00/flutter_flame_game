part of 'health_bloc.dart';

class HealthState extends Equatable {
  final int hearts;

  const HealthState({
    required this.hearts,
  });

  bool get isPlayerDead => hearts == 0;

  factory HealthState.initial() => const HealthState(hearts: 3);

  @override
  List<Object> get props => [hearts];

  HealthState copyWith({
    int? hearts,
  }) {
    return HealthState(
      hearts: hearts ?? this.hearts,
    );
  }
}
