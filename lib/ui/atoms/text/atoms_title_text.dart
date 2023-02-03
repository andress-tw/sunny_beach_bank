import 'package:flutter/material.dart';

enum TextType { title, subtitle, comment, bigText}

class AtomsTitleText extends StatelessWidget {
  final String text;
  final TextType type;
  const AtomsTitleText({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle().copyWith();

    switch (type) {
      case TextType.title:
        textStyle = const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
        break;
      case TextType.subtitle:
        textStyle = const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal);
        break;
      case TextType.comment:
        textStyle = const TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400);
        break;
       case TextType.bigText:
        textStyle = const TextStyle(
            color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold);
        break;
      default:
        textStyle;
    }
    return Text(style: textStyle, text);
  }
}
