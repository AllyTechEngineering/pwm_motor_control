import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_cubit/pwm_motor_cubit.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_direction_cubit/pwm_motor_direction_cubit.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_on_off_cubit/pwm_motor_on_off_cubit.dart';
import 'package:pwm_motor_control/services/pwm_motor_direction_service.dart';
import 'package:pwm_motor_control/services/pwm_motor_service.dart';
import 'package:pwm_motor_control/screens/home_screen.dart';

void main() {
  final pwmMotorService = PwmMotorService();
  final pwmMotorDirectionService = PwmMotorDirectionService();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PwmMotorCubit(pwmMotorService)),
        BlocProvider(create: (context) => PwmMotorOnOffCubit(pwmMotorService)),
        BlocProvider(
          create: (context) => PwmMotorDirectionCubit(pwmMotorDirectionService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PWM Motor Control',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
