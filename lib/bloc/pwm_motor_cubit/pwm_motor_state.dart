import 'package:equatable/equatable.dart';

abstract class PwmMotorState extends Equatable {
  @override
  List<Object> get props => [];
}

class PwmMotorInitial extends PwmMotorState {}

class PwmMotorUpdated extends PwmMotorState {
  final int dutyCycle;

  PwmMotorUpdated(this.dutyCycle);

  @override
  List<Object> get props => [dutyCycle];

  PwmMotorUpdated copyWith({int? dutyCycle}) {
    return PwmMotorUpdated(dutyCycle ?? this.dutyCycle);
  }

  @override
  String toString() => 'PwmMotorUpdated(dutyCycle: $dutyCycle)';
}