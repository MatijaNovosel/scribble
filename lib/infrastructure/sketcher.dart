import '../models/drawing.dart';
import 'package:flutter/material.dart';

class Sketcher extends CustomPainter {
  final List<DrawnLine?> lines;

  Sketcher({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < lines.length; ++i) {
      var line = lines[i];
      if (line != null) {
        for (int j = 0; j < line.path.length - 1; ++j) {
          var linePathA = line.path[j];
          var linePathB = line.path[j + 1];
          paint.color = line.color ?? Colors.black;
          paint.strokeWidth = line.width ?? 4.0;
          canvas.drawLine(linePathA, linePathB, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return true;
  }
}
