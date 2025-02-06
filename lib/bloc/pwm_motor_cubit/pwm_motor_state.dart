part of 'pwm_motor_cubit.dart';

class PwmMotorState extends Equatable {
  final int motorSpeed;

  const PwmMotorState({this.motorSpeed = 0});

  PwmMotorState copyWith({int? motorSpeed}) {
    return PwmMotorState(
      motorSpeed: motorSpeed ?? this.motorSpeed,
    );
  }

  @override
  List<Object> get props => [motorSpeed];

  @override
  String toString() => 'PwmMotorState(motorSpeed: $motorSpeed)';
}
