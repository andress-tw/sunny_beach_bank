import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/config/app_theme.dart';
import 'package:sunny_beach_bank/ui/atoms/avatar/avatar.dart';
import 'package:sunny_beach_bank/ui/atoms/button/button.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
            child: Column(
          children: const [
            AtomsButton(
              text: 'Hola',
              icon: Icon(Icons.abc_outlined),
            ),
            AtomsAvatar(
                url:
                    'https://www.thoughtworks.com/content/dam/thoughtworks/images/photography/thoughtworker-profile/i/pro_ivonne_burgos.jpg'),
            AtomsTitleText(type: TitleType.title, text: 'Title'),
            AtomsTitleText(type: TitleType.subtitle, text: 'Title'),
            AtomsTitleText(type: TitleType.comment, text: 'Welcome Back')
          ],
        )),
      ),
    );
  }
}
