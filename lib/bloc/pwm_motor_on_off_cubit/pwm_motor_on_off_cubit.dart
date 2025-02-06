import 'package:bloc/bloc.dart';
import 'package:pwm_motor_control/services/pwm_motor_service.dart';
import 'pwm_motor_on_off_state.dart';

class PwmMotorOnOffCubit extends Cubit<PwmMotorOnOffState> {
  final PwmMotorService pwmMotorService;

  PwmMotorOnOffCubit(this.pwmMotorService) : super(const PwmMotorOnOffState());

  void toggleMotorPower() {
    pwmMotorService.pwmMotorServiceSystemOnOff();
    emit(state.copyWith(isOn: !state.isOn));
  }
}
