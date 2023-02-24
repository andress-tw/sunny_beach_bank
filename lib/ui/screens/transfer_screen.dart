
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunny_beach_bank/config/data_provider.dart';
import 'package:sunny_beach_bank/ui/atoms/button/button.dart';
import 'package:sunny_beach_bank/ui/atoms/input_field/input_field.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/organisms/info_accounts_transfer.dart';

class TransferScreen extends StatelessWidget {
  
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  
  TransferScreen({super.key});

  final Map<String, String> formValues = {
      'amount': "0"
    };
  
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children:  [
          dataProvider.accounts.isNotEmpty?
          InfoAccountsTransfer(
            key: const Key('transfer_widget'),
            accounts: dataProvider.accounts,
            textType: TextType.title,
            subTextType: TextType.comment):
            const Center(
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator()
                  )
            ),
          Center(
            child: Form(
              key: myFormKey,
              child: 
                Column(children:[
                  const SizedBox(height: 30,),
                   AtomInputField(labelText: 'Enter amount', hintText: 'amount', formProperty: 'amount', keyboardType: TextInputType.number, formValues:formValues),
                   const SizedBox(height: 30,),
                   AtomsButton(
                    text: "Send Money",
                    onClick: () {
                      // Quitar el teclado
                    FocusScope.of(context).requestFocus(FocusNode());
                    if(!myFormKey.currentState!.validate()) {
                      return;
                    }
                    //* Todo: Imprimir valores del formulario
                    dataProvider.updateBalanceByUser(dataProvider.users[0].id, formValues['amount']);
                    Navigator.pushNamed(context, 'home');
                    }
                )
                   
                ])
          )
          )
        ]),
      ),
    );
  }
}
