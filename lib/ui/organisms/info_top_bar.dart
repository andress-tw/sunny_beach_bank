import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/molecules/avatar_card/avatar_card.dart';

class InfoTopBar extends StatelessWidget {
  final String? url;
  final String title;
  final TextType textType;
  final String subtitle;
  final TextType subTextType;

  const InfoTopBar(
      {super.key,
      this.url,
      required this.title,
      required this.textType,
      required this.subtitle,
      required this.subTextType});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AvatarCard(
            url: url,
            title: title,
            subtitle: subtitle,
            textType: textType,
            subTextType: subTextType),
        IconButton(onPressed: (() {}), icon: const Icon(Icons.logout))
      ],
    );
  }
}
