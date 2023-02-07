import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/organisms/info_accounts_transfer.dart';

class TransferScreen extends StatelessWidget {
  final Future<List<Account>> accounts;
  const TransferScreen({super.key, required this.accounts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children:  [
          FutureBuilder<List<Account>>(
            future: accounts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Account> accounts = snapshot.data!;
                return InfoAccountsTransfer(
                  key: const Key('transfer_widget'),
                  accounts: accounts,
                  textType: TextType.title,
                  subTextType: TextType.comment);
              }
              return const Text('no data');
            }
          )
        ]),
      ),
    );
  }
}
