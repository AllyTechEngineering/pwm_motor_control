import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/material.dart';

class PwmMotorDirectionService {
  static bool directionState = true; //true = forward, false = backward
  static GPIO gpio20 = GPIO(20, GPIOdirection.gpioDirOut, 0);
  static GPIO gpio21 = GPIO(21, GPIOdirection.gpioDirOut, 0);

  void initializePwmMotorDirectionService() {
    try {
      debugPrint(
        'Initial PwmMotorDirectionService Info: , ${PwmMotorDirectionService.gpio20.getGPIOinfo()}',
      );
      debugPrint(
        'Initial PwmMotorDirectionService Info: ${PwmMotorDirectionService.gpio21.getGPIOinfo()}',
      );
    } catch (e) {
      debugPrint('Error initializing PwmMotorDirectionService: $e');
    }
  } //initializePwmMotorDirectionService

  void pwmMotorServiceDirection() {
    directionState = !directionState;
    if (!directionState) {
      gpio20.write(false);
      gpio21.write(true);
    }
    if (directionState) {
      gpio20.write(true);
      gpio21.write(false);
    }
  }
} //PwmMotorDirectionService
