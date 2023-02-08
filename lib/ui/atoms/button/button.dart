import 'package:flutter/material.dart';

class AtomsButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  final double? width;
  final Function? onClick;
  const AtomsButton(
      {super.key, this.icon, required this.text, this.width, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: icon != null
          ? TextButton.icon(
              onPressed: () => onClick!(),
              icon: Icon(
                icon?.icon!,
                size: 24.0,
              ),
              label: Text(text),
            )
          : TextButton(onPressed: () => onClick!(), child: Text(text)),
    );
  }
}
