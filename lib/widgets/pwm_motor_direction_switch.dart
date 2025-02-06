import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_direction_cubit/pwm_motor_direction_cubit.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_direction_cubit/pwm_motor_direction_state.dart';

class PwmMotorDirectionSwitch extends StatelessWidget {
  const PwmMotorDirectionSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PwmMotorDirectionCubit, PwmMotorDirectionState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: state.isForward ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.isForward ? 'Direction: Forward' : 'Direction: Reverse',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Switch(
                value: state.isForward,
                onChanged: (value) {
                  context.read<PwmMotorDirectionCubit>().toggleMotorDirection();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
