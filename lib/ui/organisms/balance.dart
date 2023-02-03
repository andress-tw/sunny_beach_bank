import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/ui/atoms/button/button.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';

class Balance extends StatelessWidget {
  final String balance;
  final String accountNumber;
  const Balance(
      {super.key, required this.balance, required this.accountNumber});

  @override
  Widget build(BuildContext context) {
    String hiddenAccountNumber =
        accountNumber.substring(accountNumber.length - 4, accountNumber.length);
    return Card(
      color: Colors.indigo[25],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const AtomsTitleText(
                  text: 'Your balance is', type: TextType.comment),
              const SizedBox(
                height: 20,
              ),
              AtomsTitleText(text: '\$$balance', type: TextType.bigText),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const AtomsButton(
                  text: 'Statistic',
                  icon: Icon(Icons.show_chart),
                  width: 120,
                ),
                const SizedBox(
                  height: 20,
                ),
                AtomsTitleText(
                    text: hiddenAccountNumber, type: TextType.comment),
              ],
            )
          ],
        ),
      ),
    );
  }
}
