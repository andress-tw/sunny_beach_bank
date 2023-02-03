import 'package:flutter/material.dart';

class AtomsButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  final double? width;
  const AtomsButton({super.key, this.icon, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      child: icon != null
          ? TextButton.icon(
              onPressed: () {},
              icon: Icon(
                icon?.icon!,
                size: 24.0,
              ),
              label: Text(text),
            )
          : TextButton(onPressed: () => {}, child: Text(text)),
    );
  }
}
