import 'package:flutter/material.dart';
import '../theme/color_pallete/pallete.dart';

class CustomBorder {
  static OutlineInputBorder get border => OutlineInputBorder(
    borderSide: BorderSide(color: Pallete.gradient1, width: 2),
    borderRadius: BorderRadius.circular(20),
  );
}
