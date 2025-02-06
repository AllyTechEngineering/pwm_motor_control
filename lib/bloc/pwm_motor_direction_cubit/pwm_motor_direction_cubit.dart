import 'package:bloc/bloc.dart';
import 'package:pwm_motor_control/services/pwm_motor_direction_service.dart';
import 'pwm_motor_direction_state.dart';

class PwmMotorDirectionCubit extends Cubit<PwmMotorDirectionState> {
  final PwmMotorDirectionService pwmMotorDirectionService;

  PwmMotorDirectionCubit(this.pwmMotorDirectionService)
      : super(const PwmMotorDirectionState()) {
    pwmMotorDirectionService.initializePwmMotorDirectionService();
  }

  void toggleMotorDirection() {
    pwmMotorDirectionService.pwmMotorServiceDirection();
    emit(state.copyWith(isForward: !state.isForward));
  }
}
