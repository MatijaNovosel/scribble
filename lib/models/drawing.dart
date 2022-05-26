import 'dart:ui';

import 'package:scribble/utils/extensions.dart';
import 'package:scribble/utils/helpers.dart';

class DrawnLine {
  List<Offset> path = [];
  Color? color;
  double? width;

  DrawnLine(this.path, this.color, this.width);

  DrawnLine.fromJson(Map<String, dynamic> json) {
    color = hexStringToColor(json["color"]);
    width = json["width"].toDouble();
    path = [];
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color?.toHex(),
      'width': width,
      'path': path
          .map(
            (p) => ({
              'direction': p.direction,
              'distance': p.distance,
              'dx': p.dx,
              'dy': p.dy,
            }),
          )
          .toList(),
    };
  }

  @override
  String toString() {
    return """
      [color]: $color
      [width]: $width
    """;
  }
}

class CanvasUpdateModel {
  DrawnLine? line;
  String? socketId;

  CanvasUpdateModel(this.line, this.socketId);

  CanvasUpdateModel.fromJson(Map<String, dynamic> json) {
    socketId = json["socketId"];
    line = DrawnLine.fromJson(json["line"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'socketId': socketId,
      'line': line?.toJson(),
    };
  }

  @override
  String toString() {
    return """
      [socketId]: $socketId
      [line]: $line
    """;
  }
}
