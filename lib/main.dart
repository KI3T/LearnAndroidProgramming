import 'package:flutter/material.dart';
import 'calculator.dart';
import 'design.dart';
import 'hello_world.dart';
import 'change_background.dart';
import 'primality_test.dart';

void main() {
  // Set the flag here to choose between calculator.dart, design.dart, or hello_world.dart
  bool useCalculator = false;
  bool useDesign = false;
  bool useHelloWorld = false;
  bool useChangeBackground = false;
  bool usePrimalityTest = true;

  if (useCalculator) {
    runApp(const MyAppCalculator());
  } else if (useDesign) {
    runApp(const MyAppDesign());
  } else if (useHelloWorld) {
    runApp(const MyAppHelloWorld());
  } else if (useChangeBackground) {
    runApp(const MyAppChangeBackground());
  } else if (usePrimalityTest) {
    runApp(const MyAppPrimality());
  }
}
