import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  TextStyle? style;
  int? maxLines;
  TextOverflow? textOverflow;
  TextAlign? textAlign;
  AppText({
    super.key,
    required this.text,
    this.color = Colors.black54,
    this.size = 16,
    this.style,
    this.maxLines,
    this.textOverflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      overflow: textOverflow,

      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
