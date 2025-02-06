import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_cubit/pwm_motor_cubit.dart';
import 'package:pwm_motor_control/services/pwm_motor_service.dart';
import 'package:pwm_motor_control/widgets/pwm_motor_speed_slider.dart';
import 'package:pwm_motor_control/widgets/pwm_motor_toggle_switch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PwmMotorCubit(PwmMotorService()),
      child: Scaffold(
        appBar: AppBar(title: const Text('PWM Motor Control')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PwmMotorSpeedSlider(),
            SizedBox(height: 20),
            PwmMotorToggleSwitch(),
          ],
        ),
      ),
    );
  }
}
