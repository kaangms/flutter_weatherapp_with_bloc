import 'package:flutter/material.dart';

class TransBackgroundColor extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  const TransBackgroundColor(
      {Key? key, required this.color, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                color[700]!,
                color[500]!,
                color[300]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8, 1])),
    );
  }
}
