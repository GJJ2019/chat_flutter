import 'package:flutter/material.dart';

import '../../../theme/style.dart';

class Bubble extends StatelessWidget {
  const Bubble({
    Key key,
    this.isSender = true,
    @required this.text,
    @required this.email,
    this.color = Colors.white70,
    this.tail = true,
    this.photoUrl,
  }) : super(key: key);

  final bool isSender;
  final String text;
  final bool tail;
  final Color color;
  final String email, photoUrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isSender && photoUrl == null) CircleAvatar(child: Text(email[0].toUpperCase())),
            if (!isSender && photoUrl != null) CircleAvatar(backgroundImage: NetworkImage(photoUrl)),
            CustomPaint(
              painter: SpecialChatBubbleOne(
                  color: color, alignment: isSender ? Alignment.topRight : Alignment.topLeft, tail: tail),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .8,
                ),
                padding: const EdgeInsets.all(5),
                margin: isSender ? const EdgeInsets.fromLTRB(7, 7, 17, 7) : const EdgeInsets.fromLTRB(17, 7, 7, 7),
                child: Stack(
                  children: <Widget>[
                    Text(text, style: medium.copyWith(color: Style.whiteColor)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialChatBubbleOne extends CustomPainter {
  SpecialChatBubbleOne({
    @required this.color,
    this.alignment,
    this.tail,
  });

  final Color color;
  final Alignment alignment;
  final bool tail;

  final double _radius = 10.0;
  final double _x = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (alignment == Alignment.topRight) {
      if (tail) {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              0,
              0,
              size.width - _x,
              size.height,
              bottomLeft: Radius.circular(_radius),
              bottomRight: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
        final path = Path()
          ..moveTo(size.width - _x, 0)
          ..lineTo(size.width - _x, 10)
          ..lineTo(size.width, 0);
        canvas
          ..clipPath(path)
          ..drawRRect(
            RRect.fromLTRBAndCorners(
              size.width - _x,
              0.0,
              size.width,
              size.height,
              topRight: const Radius.circular(3),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill,
          );
      } else {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              0,
              0,
              size.width - _x,
              size.height,
              bottomLeft: Radius.circular(_radius),
              bottomRight: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    } else {
      if (tail) {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              _x,
              0,
              size.width,
              size.height,
              bottomRight: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
              bottomLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
        final path = Path()
          ..moveTo(_x, 0)
          ..lineTo(_x, 10)
          ..lineTo(0, 0);
        canvas
          ..clipPath(path)
          ..drawRRect(
              RRect.fromLTRBAndCorners(
                0,
                0.0,
                _x,
                size.height,
                topLeft: const Radius.circular(3),
              ),
              Paint()
                ..color = color
                ..style = PaintingStyle.fill);
      } else {
        canvas.drawRRect(
            RRect.fromLTRBAndCorners(
              _x,
              0,
              size.width,
              size.height,
              bottomRight: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
              bottomLeft: Radius.circular(_radius),
              topLeft: Radius.circular(_radius),
            ),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
