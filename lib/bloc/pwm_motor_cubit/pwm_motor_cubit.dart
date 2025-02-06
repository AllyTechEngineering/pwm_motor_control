import 'package:bloc/bloc.dart';
import 'package:pwm_motor_control/services/pwm_motor_service.dart';
import 'pwm_motor_state.dart';
class PwmMotorCubit extends Cubit<PwmMotorState> {
 final PwmMotorService pwmMotorService;

  PwmMotorCubit(this.pwmMotorService) : super(PwmMotorInitial());

  void updateDutyCycle(int dutyCycle) {
    pwmMotorService.updatePwmDutyCycle(dutyCycle);
    emit(PwmMotorUpdated(dutyCycle));
  }
}