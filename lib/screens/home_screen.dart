import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_cubit/pwm_motor_cubit.dart';
import 'package:pwm_motor_control/services/pwm_motor_service.dart';
import 'package:pwm_motor_control/widgets/pwm_motor_direction_switch.dart';
import 'package:pwm_motor_control/widgets/pwm_motor_speed_slider.dart';
import 'package:pwm_motor_control/widgets/pwm_motor_toggle_switch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PwmMotorCubit(PwmMotorService()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PWM Motor Control'),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 600, // Keep UI centered and constrained
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Vertical PWM Speed Slider (Left Side) with increased height
                SizedBox(
                  width: 100.0, // Keep slider narrow
                  height: 300.0, // Match the combined switch height
                  child: const PwmMotorSpeedSlider(vertical: true),
                ),

                // Space between slider and switches
                const SizedBox(width: 40),

                // Column for Direction and Power Switches (Right Side)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    PwmMotorDirectionSwitch(),
                    SizedBox(height: 20),
                    PwmMotorToggleSwitch(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
