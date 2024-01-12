import 'package:flutter/material.dart';

Text text(String text, double size, Color color, int family) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontFamily: family == 1
          ? 'mont'
          : family == 2
              ? 'mont2'
              : 'mont3',
    ),
  );
}
