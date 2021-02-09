import 'package:flutter/material.dart';

import '../theme/style.dart';

/// Get common button style
class Button extends StatelessWidget {
  /// Create button with common pattern
  const Button({
    Key key,
    @required this.onPressed,
    @required this.title,
    this.isLoading = false,
  }) : super(key: key);

  /// [onPressed] callback after user presses the button
  final VoidCallback onPressed;

  /// [title]  for button
  final String title;

  /// for showing loading indicator when [isLoading] is true
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: Style.accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Text(
        isLoading ? 'Loading...' : title,
        style: semiBoldMedium.copyWith(color: Style.whiteColor),
      ),
    );
  }
}
