import 'package:flutter/material.dart';

enum TitleType { title, subtitle, comment }

class AtomsTitleText extends StatelessWidget {
  final String text;
  final TitleType type;
  const AtomsTitleText({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle().copyWith();

    switch (type) {
      case TitleType.title:
        textStyle = const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
        break;
      case TitleType.subtitle:
        textStyle = const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);
        break;
      case TitleType.comment:
        textStyle = const TextStyle(
            color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400);
        break;
      default:
        textStyle;
    }
    return Text(style: textStyle, text);
  }
}
