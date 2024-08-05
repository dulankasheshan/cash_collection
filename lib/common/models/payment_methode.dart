import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod {
  final String name;
  final SvgPicture icon;

  PaymentMethod({required this.name, required this.icon});
}
