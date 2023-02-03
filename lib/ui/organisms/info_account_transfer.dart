import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/molecules/avatar_card/avatar_card.dart';

class InfoAccountTransfer extends StatelessWidget
{
  final String url;
  final String title;
  final TextType textType;
  final String subtitle;
  final TextType subTextType;

  const InfoAccountTransfer({super.key, required this.url, required this.title, required this.textType, required this.subtitle, required this.subTextType});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AvatarCard(url: url, title: title, subtitle: subtitle, textType: textType, subTextType: subTextType),
            const Icon(Icons.credit_card_rounded)
          ],
        ),
      ),
    );
  }
}