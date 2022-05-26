import 'package:flutter/material.dart';
import 'package:scribble/extensions.dart';

class DrawnLine {
  final List<Offset?> path;
  final Color color;
  final double width;

  DrawnLine(this.path, this.color, this.width);

  Map<String, dynamic> toJson() {
    return {
      'color': color.toHex(),
      'width': width,
      'path': path
          .map(
            (p) => ({
              'direction': p?.direction,
              'distance': p?.distance,
              'distanceSquared': p?.distanceSquared,
              'dx': p?.dx,
              'dy': p?.dy,
              'isFinite': p?.isFinite,
              'isInfinite': p?.isInfinite,
            }),
          )
          .toList(),
    };
  }
}
