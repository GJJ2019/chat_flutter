import 'package:flutter/widgets.dart';

import '../theme/style.dart';

///
/// for creating custom container with default style
///
class CustomContainer extends StatelessWidget {
  ///
  const CustomContainer({
    Key key,
    @required this.child,
    @required this.width,
    @required this.height,
    @required this.margin,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  /// child of the [CustomContainer]
  final Widget child;

  /// padding and margin of the [CustomContainer]
  final EdgeInsets padding, margin;

  /// height, width of the [CustomContainer]
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Style.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(offset: Offset(2, 2), color: Style.shadowColor, blurRadius: 16),
        ],
      ),
      child: child,
    );
  }
}
