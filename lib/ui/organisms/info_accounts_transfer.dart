
import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/molecules/avatar_card/avatar_card.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';

class InfoAccountsTransfer extends StatefulWidget {

  final List<Account> accounts;
  final TextType textType;
  final TextType subTextType;

  const InfoAccountsTransfer(
      {super.key,
      required this.textType,
      required this.subTextType, required this.accounts});

  @override
  State<InfoAccountsTransfer> createState() => _InfoAccountsTransferState();
}

class _InfoAccountsTransferState extends State<InfoAccountsTransfer> {
  String? selectedAccountId;
  @override
  Widget build(BuildContext context) {
    final  itemsList = <PopupMenuEntry>[];

    for(var account in widget.accounts){
      itemsList.add(PopupMenuItem(
                  value: account.user.id,
                  child: Text("${account.user.name} ${account.user.lastName}" )
                  
                  )
      );
    }
     
    
    Account selectedAccount = widget.accounts[int.parse(selectedAccountId??"1")];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            AvatarCard(
                url: selectedAccount.user.profilePath,
                title: "${selectedAccount.user.name} ${selectedAccount.user.lastName}",
                subtitle: selectedAccount.id,
                textType: widget.textType,
                subTextType: widget.subTextType),
            //const Icon(Icons.credit_card_rounded),
            PopupMenuButton(
              initialValue: widget.accounts[0].user.id,
              onSelected: (value) => setState(() {
                
                selectedAccountId = value;
                
              }),
              itemBuilder:(context) => itemsList
               
            )
          ],
        ),
      ),
    );
  }
}

