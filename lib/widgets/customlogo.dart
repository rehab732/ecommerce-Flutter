import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/maintext.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
         Image(
          image: AssetImage("images/icons/splash.png"),
        ),
        MainText(
          data: 'Shop Now',
          color: redcolor,
        ),
      ],
    );
  }
}
