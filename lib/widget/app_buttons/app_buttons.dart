import 'package:flutter/material.dart';
import 'package:travel_app/widget/app_text/app_text.dart';

import '../../utils/app_color.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final String? text;
  IconData? icon;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  final bool? isIcon;

  AppButtons({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.icon,
    this.text,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      //margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: isIcon == false
          ? Center(
              child: AppText(text: text!, color: color),
            )
          : Center(child: Icon(icon, color: color)),
    );
  }
}
