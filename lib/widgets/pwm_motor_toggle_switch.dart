import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_on_off_cubit/pwm_motor_on_off_cubit.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_on_off_cubit/pwm_motor_on_off_state.dart';

class PwmMotorToggleSwitch extends StatelessWidget {
  const PwmMotorToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PwmMotorOnOffCubit, PwmMotorOnOffState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Motor Power On / Off'),
            Switch(
              value: state.isOn,
              onChanged: (value) {
                context.read<PwmMotorOnOffCubit>().toggleMotorPower();
              },
            ),
          ],
        );
      },
    );
  }
}
