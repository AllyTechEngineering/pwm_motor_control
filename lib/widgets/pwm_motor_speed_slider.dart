import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_cubit/pwm_motor_cubit.dart';

class PwmMotorSpeedSlider extends StatelessWidget {
  const PwmMotorSpeedSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PwmMotorCubit, PwmMotorState>(
      builder: (context, state) {
        return Column(
          children: [
            Slider(
              value: state.motorSpeed.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: 'Motor Dutycycle: ${state.motorSpeed}%',
              onChanged: (value) {
                context.read<PwmMotorCubit>().updateMotorSpeed(value.toInt());
              },
            ),
            Text('Motor Speed: ${state.motorSpeed}%'),
          ],
        );
      },
    );
  }
}
