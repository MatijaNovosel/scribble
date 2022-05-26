import 'dart:ui';

Color hexStringToColor(String hex) {
  return Color(
    int.parse(
      hex.replaceAll("#", "0xff"),
    ),
  );
}
