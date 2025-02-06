import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';

class PwmMotorService {
  static PWM pwm0 = PWM(2, 0);
  static PWM pwm1 = PWM(2, 1);
  static PWM pwm2 = PWM(2, 2);
  static PWM pwm3 = PWM(2, 3);

  static bool systemOnOffState = true;
  int setPwmPeriod = 10000000; //10000000ns = 100Hz freq, 1000000ns = 1000 Hz

  void initializePwmMotorService() {
    try {
      // pwm = PWM(0, 1);
      debugPrint('Initial PwmMotorService Info: ${pwm0.getPWMinfo()}');
    } catch (e) {
      debugPrint('Initial PwmMotorService Error: $e');
    }
    try {
      pwm0.setPeriodNs(10000000);
      pwm1.setPeriodNs(10000000);
      pwm2.setPeriodNs(10000000);
      pwm3.setPeriodNs(10000000);
      debugPrint('PwmMotorService period Info: ${pwm0.getPeriodNs()}');
    } catch (e) {
      debugPrint('PwmMotorService period Error: $e');
    }
    try {
      pwm0.setDutyCycleNs(0);
      pwm1.setDutyCycleNs(0);
      pwm2.setDutyCycleNs(0);
      pwm3.setDutyCycleNs(0);
      debugPrint('PwmMotorService Dutycycle Info: ${pwm0.getDutyCycleNs()}');
    } catch (e) {
      debugPrint('PwmMotorService Dutycycle Error: $e');
    }
    try {
      pwm0.enable();
      pwm1.enable();
      pwm2.enable();
      pwm3.enable();
      debugPrint('PwmMotorService Enable Info: ${pwm0.getEnabled()}');
    } catch (e) {
      debugPrint('PwmMotorService Enable Error: $e');
    }
    try {
      pwm0.setPolarity(Polarity.pwmPolarityNormal);
      pwm1.setPolarity(Polarity.pwmPolarityNormal);
      pwm2.setPolarity(Polarity.pwmPolarityNormal);
      pwm3.setPolarity(Polarity.pwmPolarityNormal);
      // debugPrint('PwmMotorService Polarity Info: ${pwm.getPolarity()}');
      // debugPrint('Final PwmMotorService Info: ${pwm.getPWMinfo()}');
    } catch (e) {
      debugPrint('PwmMotorService Polarity Error: $e');
    }
  }

  void updatePwmDutyCycle(int updateDutyCycle) {
    // debugPrint(
    //     'In PwmMotorService updatePwmDutyCycle systemOnOffSate: $systemOnOffState');
    if (systemOnOffState) {
      pwm0.setDutyCycleNs(updateDutyCycle * 100000);
      pwm1.setDutyCycleNs(updateDutyCycle * 100000);
      pwm2.setDutyCycleNs(updateDutyCycle * 100000);
      pwm3.setDutyCycleNs(updateDutyCycle * 100000);
      debugPrint(
        'In PwmMotorService updatePwmDutyCycle DutyCycleNs= ${pwm0.getDutyCycleNs()}',
      );
      debugPrint(
        'In PwmMotorService updatePwmDutyCycle PWM Info: ${pwm0.getPWMinfo()}',
      );
    }
  }

  void pwmMotorServiceSystemOnOff() {
    systemOnOffState = !systemOnOffState;
    // debugPrint('In PwmMotorService systemOnOffState: $systemOnOffState');
    if (!systemOnOffState) {
      pwm0.disable();
      pwm1.disable();
      pwm2.disable();
      pwm3.disable();
      // debugPrint('In PwmMotorService enable: ${pwm.getEnabled()}');
    }
    if (systemOnOffState) {
      pwm0.enable();
      pwm1.enable();
      pwm2.enable();
      pwm3.enable();
      // debugPrint('In PwmMotorService enable: ${pwm.getEnabled()}');
    }
  }
} // End of class PwmMotorService
