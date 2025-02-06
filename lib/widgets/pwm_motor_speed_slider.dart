import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwm_motor_control/bloc/pwm_motor_cubit/pwm_motor_cubit.dart';
import 'package:pwm_motor_control/widgets/rectangular_slider_thumb_shape.dart';

class PwmMotorSpeedSlider extends StatelessWidget {
  final bool vertical;

  const PwmMotorSpeedSlider({super.key, this.vertical = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PwmMotorCubit, PwmMotorState>(
      builder: (context, state) {
        return SizedBox(
          height: 300, // Ensures full height is used
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Speed: ${state.motorSpeed}%',
                style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              ),

              Expanded( // Allows the slider to expand fully
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 6, // Thicker track
                    // thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                     thumbShape: const RectangularSliderThumbShape(), 
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.black,
                    showValueIndicator: ShowValueIndicator.always,
                    valueIndicatorColor: Colors.blueGrey,
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: Colors.blueGrey,
                    thumbColor: Colors.deepOrangeAccent,
                    valueIndicatorTextStyle: const TextStyle(color: Colors.white),
                  ),
                  child: RotatedBox(
                    quarterTurns: vertical ? 3 : 0, // Rotate slider vertically
                    child: Slider(
                      value: state.motorSpeed.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 10, // Add tick marks (10 steps)
                      label: '${state.motorSpeed}%', // Display percentage
                      onChanged: (value) {
                        context.read<PwmMotorCubit>().updateMotorSpeed(value.toInt());
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
