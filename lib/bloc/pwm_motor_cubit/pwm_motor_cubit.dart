import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pwm_motor_control/services/pwm_motor_service.dart';

part 'pwm_motor_state.dart';

class PwmMotorCubit extends Cubit<PwmMotorState> {
  final PwmMotorService pwmMotorService;

  PwmMotorCubit(this.pwmMotorService) : super(const PwmMotorState()){
    pwmMotorService.initializePwmMotorService();
  }
  
  void updateMotorSpeed(int speed) {
    emit(state.copyWith(motorSpeed: speed));
    pwmMotorService.updatePwmDutyCycle(speed);
  }
}
