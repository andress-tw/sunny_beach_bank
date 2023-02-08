
import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/ui/atoms/button/button.dart';
import 'package:sunny_beach_bank/ui/atoms/input_field/input_field.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/organisms/info_accounts_transfer.dart';

class TransferScreen extends StatelessWidget {
  final Future<List<Account>> accounts;
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  
  TransferScreen({super.key, required this.accounts});

  final Map<String, String> formValues = {
      'amount': "0"
    };
  
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
                    print(formValues);
                    Navigator.pushNamed(context, 'home');
                    }
                    
                  // child: const SizedBox(
                  //   width: double.infinity,
                  //   child: Center(
                  //     child: Text('Send Money')
                  //     )
                  //   )
                )
                   
                ])
                
              
          )
          )
        ]),
      ),
    );
  }
}
