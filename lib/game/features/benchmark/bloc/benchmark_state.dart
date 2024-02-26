part of 'benchmark_bloc.dart';

class BenchmarkState extends Equatable {
  final bool isRunning;

  const BenchmarkState({
    this.isRunning = false,
  });

  factory BenchmarkState.initial() => const BenchmarkState();

  @override
  List<Object> get props => [isRunning];

  BenchmarkState copyWith({
    bool? isRunning,
  }) {
    return BenchmarkState(
      isRunning: isRunning ?? this.isRunning,
    );
  }
}
