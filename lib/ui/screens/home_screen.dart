import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/organisms/info_top_bar.dart';

class HomeScreen extends StatelessWidget {
  
  final Future<User> user;
  final Future<List<Account>> accounts;
  const HomeScreen({super.key, required this.user, required this.accounts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sunny Beach Bank'),
        ),
        body: Center(
            child: Column(
          children: const [
            InfoTopBar(
              url: 'https://www.thoughtworks.com/content/dam/thoughtworks/images/photography/thoughtworker-profile/i/pro_ivonne_burgos.jpg',
              title: 'Welcome Back',
              titleType: TitleType.comment,
              subtitle: 'Ivonne',
              subTitletype: TitleType.subtitle
            )
          ],
        )),
      );
  }
}