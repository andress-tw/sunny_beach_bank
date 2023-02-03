import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/ui/atoms/avatar/avatar.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';

class AvatarCard extends StatelessWidget {
  final String url;
  final String title;
  final TitleType titletype;
  final String subtitle;
  final TitleType subTitletype;

  const AvatarCard(
      {super.key,
      required this.url,
      required this.title,
      required this.subtitle,
      required this.titletype,
      required this.subTitletype});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      AtomsAvatar(url: url),
      const SizedBox(width: 8.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AtomsTitleText(type: titletype, text: title),
          AtomsTitleText(type: subTitletype, text: subtitle)
        ],
      )
    ]);
  }
}
