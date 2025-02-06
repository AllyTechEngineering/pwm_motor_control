import 'package:equatable/equatable.dart';

class PwmMotorDirectionState extends Equatable {
  final bool isForward; // true = Forward, false = Reverse

  const PwmMotorDirectionState({this.isForward = true});

  PwmMotorDirectionState copyWith({bool? isForward}) {
    return PwmMotorDirectionState(
      isForward: isForward ?? this.isForward,
    );
  }

  @override
  List<Object> get props => [isForward];

  @override
  String toString() => 'PwmMotorDirectionState(isForward: $isForward)';
}
