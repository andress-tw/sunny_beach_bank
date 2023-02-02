import 'package:flutter/material.dart';

class AtomsButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  const AtomsButton({super.key, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
