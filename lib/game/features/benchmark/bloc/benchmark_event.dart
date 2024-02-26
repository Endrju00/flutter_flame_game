part of 'benchmark_bloc.dart';

@immutable
sealed class BenchmarkEvent  {}

class EnableBenchmarkEvent extends BenchmarkEvent {}

class DisableBenchmarkEvent extends BenchmarkEvent {}
