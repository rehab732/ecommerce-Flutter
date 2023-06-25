import 'package:ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final String data;
  final Color color;
  const MainText({required this.data, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(fontSize: 25, fontFamily: 'Pacifico', color: color),
    );
  }
}
