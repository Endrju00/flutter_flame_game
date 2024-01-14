part of 'health_bloc.dart';

@immutable
sealed class HealthEvent {}

class DecreaseHealthEvent extends HealthEvent {}

class ResetHealthEvent extends HealthEvent {}
