import 'package:equatable/equatable.dart';

class PwmMotorOnOffState extends Equatable {
  final bool isOn;

  const PwmMotorOnOffState({this.isOn = true});

  PwmMotorOnOffState copyWith({bool? isOn}) {
    return PwmMotorOnOffState(
      isOn: isOn ?? this.isOn,
    );
  }

  @override
  List<Object> get props => [isOn];

  @override
  String toString() => 'PwmMotorOnOffState(isOn: $isOn)';
}
