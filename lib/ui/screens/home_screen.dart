import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/ui/atoms/button/button.dart';
import 'package:sunny_beach_bank/ui/atoms/text/atoms_title_text.dart';
import 'package:sunny_beach_bank/ui/organisms/balance.dart';
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
      body: Stack(children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder<User>(
                  future: user,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      User user = snapshot.data!;
                      return InfoTopBar(
                          url: user.profilePath != null
                              ? user.profilePath!
                              : 'https://via.placeholder.com/150',
                          title: 'Welcome Back',
                          textType: TextType.comment,
                          subtitle: '${user.name} ${user.lastName}',
                          subTextType: TextType.subtitle);
                    } else if (snapshot.hasError) {
                      return const Text(
                          'Ha ocurrido un error, lo resolveremos en la brevedad posible');
                    }

                    return const Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator()));
                  })),
                  SizedBox(height: 20,),
                  FutureBuilder<List<Account>>(
                    future: accounts,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Account account = snapshot.data![0];
                        return Balance(balance: account.balance.toString(), accountNumber: account.id,);
                      }
                     return Text('no data');
                    }
                  )
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
                children: const [
                  AtomsButton(
                    text: 'Request',
                    icon: Icon(Icons.call_received),
                    width: 150,
                  ),
                  SizedBox(width: 50),
                  AtomsButton(
                    text: 'Send',
                    icon: Icon(Icons.call_made),
                    width: 150,
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
