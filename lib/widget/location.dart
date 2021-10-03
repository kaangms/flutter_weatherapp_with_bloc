import 'package:flutter/material.dart';
import 'package:turkish/turkish.dart';

class LocationWidget extends StatelessWidget {
  final String selectCity;

  const LocationWidget({Key? key, required this.selectCity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      turkish.toUpperCase(selectCity),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
