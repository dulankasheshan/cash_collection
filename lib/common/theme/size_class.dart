import 'package:flutter/widgets.dart';

class SizeClass {
  static double screenWidth = 0;
  static double screenHeight = 0;

  // Method to update screen dimensions
  static void updateSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  // Get a width based on a percentage of screen width
  static double getWidth(double percentage) {
    return screenWidth * percentage;
  }

  // Get a height based on a percentage of screen height
  static double getHeight(double percentage) {
    return screenHeight * percentage;
  }
}
