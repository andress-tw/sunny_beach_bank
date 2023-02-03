import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/organisms/info_account_transfer.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Transfer Money'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            InfoAccountTransfer(
              key: Key('transfer_widget'),
              url: '',
              title: 'Cristofer Lips', 
              textType: TextType.title, 
              subtitle: "",//account.balance.toString(), 
              subTextType: TextType.comment)
        ]),
      ),
    );
  }
}