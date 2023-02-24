import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunny_beach_bank/config/data_provider.dart';
import 'package:sunny_beach_bank/ui/atoms/button/button.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/organisms/balance.dart';
import 'package:sunny_beach_bank/ui/organisms/info_top_bar.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final dataProvider = Provider.of<DataProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunny Beach Bank'),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              dataProvider.users.isNotEmpty ?
              InfoTopBar(
                          url: dataProvider.users[0].profilePath,
                          title: 'Welcome Back',
                          textType: TextType.comment,
                          subtitle: '${dataProvider.users[0].name} ${dataProvider.users[0].lastName}',
                          subTextType: TextType.subtitle):
              const Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator())),
                 
             
              const SizedBox(
                height: 20,
              ),
               dataProvider.accounts.isNotEmpty ?
              Balance(
                        balance: dataProvider.balance.toString(),
                        accountNumber: dataProvider.accounts[0].id,
                      ):
                      const Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator())),
              
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AtomsButton(
                    text: 'Request',
                    icon: Icon(Icons.call_received),
                    width: 150,
                  ),
                  const SizedBox(width: 50),
                  AtomsButton(
                    text: 'Send',
                    icon: const Icon(Icons.call_made),
                    width: 150,
                    onClick: () => Navigator.pushNamed(context, 'transfer'),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.indigo[800],
        onTap: ((value) {}),
      ),
    );
  }
}
