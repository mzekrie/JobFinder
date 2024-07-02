import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color color;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;

  const DefaultText(
      {super.key,
        required this.text,
        this.maxLines,
        this.color = Colors.black,
        this.textAlign,
        this.textScaleFactor,
        this.fontWeight = FontWeight.normal,
        //this.overflow = TextOverflow.ellipsis,
        this.overflow,
        this.textDecoration,
        this.fontSize = 30, });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
    );
  }
}

//
// DefaultText(
// text: " Or Register With Account",
// color: AppTheme.grayGP,
// fontSize: 15,
// fontWeight: FontWeight.normal,
// ),

