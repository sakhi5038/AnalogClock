import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const totalNoOfTicks = 60;
    const angleOfRotation = 2 * pi / totalNoOfTicks;
    final width = size.width;
    final height = size.height;
    final radius = min(width, height) / 2;

    final hoursTickLength = radius * 0.1;
    final minutesTickLength = radius * 0.05;
    final hoursTickStrokeWidth = radius * 0.006;
    final minutesTickStrokeWidth = radius * 0.003;
    final centerOffset = Offset(width / 2, height / 2);

    final paint = Paint()..color = Colors.blue;
    final hoursTickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = hoursTickStrokeWidth;

    final minutesTickPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = minutesTickStrokeWidth;

    // Draw Dail Of The Clock
    canvas.drawCircle(centerOffset, radius, paint);
    // Draw Ticks
    canvas.translate(centerOffset.dx, centerOffset.dy);
    canvas.save();
    for (var i = 0; i < totalNoOfTicks; i++) {
      if (i % 5 == 0) {
        // Draw Hours Ticks
        canvas.drawLine(Offset(0, -radius),
            Offset(0, -radius + hoursTickLength), hoursTickPaint);
      } else {
        // Draw Minutes Ticks
        canvas.drawLine(Offset(0, -radius),
            Offset(0, -radius + minutesTickLength), minutesTickPaint);
      }

      canvas.rotate(angleOfRotation);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => false;
}
