import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/molecules/avatar_card/avatar_card.dart';

class InfoTopBar extends StatelessWidget
{
  final String url;
  final String title;
  final TitleType titleType;
  final String subtitle;
  final TitleType subTitletype;

  const InfoTopBar({super.key, required this.url, required this.title, required this.titleType, required this.subtitle, required this.subTitletype});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AvatarCard(url: url, title: title, subtitle: subtitle, titletype: titleType, subTitletype: subTitletype),
        IconButton(onPressed: (() {}), icon: const Icon(Icons.logout))
      ],
    );
  }
}