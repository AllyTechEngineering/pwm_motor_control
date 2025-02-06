import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/material.dart';

class PwmMotorDirectionService {
  static bool directionState = true; //true = forward, false = backward
  static GPIO gpio5 = GPIO(5, GPIOdirection.gpioDirOut, 0);
  static GPIO gpio6 = GPIO(6, GPIOdirection.gpioDirOut, 0);

  void initializePwmMotorDirectionService() {
    gpio5.write(true);
    gpio6.write(false);
    try {
      debugPrint(
        'Initial PwmMotorDirectionService Info: , ${PwmMotorDirectionService.gpio5.getGPIOinfo()}',
      );
      debugPrint(
        'Initial PwmMotorDirectionService Info: ${PwmMotorDirectionService.gpio6.getGPIOinfo()}',
      );
    } catch (e) {
      debugPrint('Error initializing PwmMotorDirectionService: $e');
    }
  } //initializePwmMotorDirectionService

  void pwmMotorServiceDirection() {
    // debugPrint('Changing motor direction...');

    // Set both GPIOs to true before changing direction
    gpio5.write(true);
    gpio6.write(true);
    // debugPrint('GPIO5 and GPIO6 set to true (Brake)');

    // Delay 500ms to allow safe direction change
    Future.delayed(const Duration(milliseconds: 500), () {
      directionState = !directionState;

      if (!directionState) {
        gpio5.write(false);
        gpio6.write(true);
        // debugPrint('Direction changed: Reverse');
      } else {
        gpio5.write(true);
        gpio6.write(false);
        // debugPrint('Direction changed: Forward');
      }
    });
  }
} //PwmMotorDirectionService
