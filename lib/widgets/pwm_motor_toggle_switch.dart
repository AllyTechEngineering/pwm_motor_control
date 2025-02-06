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
        return Container(
          width: 200.0,
          height: 150.0,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: state.isOn ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.isOn ? 'Motor: ON' : 'Motor: OFF',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Switch(
                value: state.isOn,
                onChanged: (value) {
                  context.read<PwmMotorOnOffCubit>().toggleMotorPower();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
