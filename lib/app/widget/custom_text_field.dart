import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/style.dart';

/// [CustomTextField]  for all app
/// using [title] [TextEditingController] [icon] as [@required] params
/// & [maxLength] as optional
class CustomTextField extends StatelessWidget {
  ///
  const CustomTextField({
    Key key,
    @required this.title,
    @required this.textEditingController,
    @required this.icon,
    this.width,
    this.maxLength,
    this.maxLines = 1,
    this.hintText = '',
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  /// [title]
  final String title;

  /// [textEditingController]
  final TextEditingController textEditingController;

  /// [maxLength]
  final int maxLength;

  /// [icon]
  final IconData icon;

  /// [width]
  final double width;

  /// [maxLines]
  final int maxLines;

  /// [hintText]
  final String hintText;

  /// [obscureText]
  final bool obscureText;

  ///
  final IconButton suffixIcon;

  ///
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width * 0.3,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: title,
          prefixIcon: Icon(icon),
          hintText: hintText,
          suffixIcon: suffixIcon ?? const SizedBox(),
        ),
        style: semiBoldMedium,
        controller: textEditingController,
        maxLength: maxLength,
        maxLines: maxLines,
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}
