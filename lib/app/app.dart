import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunny_beach_bank/config/app_theme.dart';
import 'package:sunny_beach_bank/config/routes/app_routes.dart';
import 'package:sunny_beach_bank/config/data_provider.dart';
import 'package:sunny_beach_bank/ui/screens/home_screen.dart';
import 'package:sunny_beach_bank/ui/screens/transfer_screen.dart';

class SunnyBeachBankApp extends ConsumerWidget {
  const SunnyBeachBankApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case (AppRoutes.home):
            return MaterialPageRoute(
                builder: ((context) => HomeScreen(
                      user: ref.watch(userDataProvider).getUser("1"),
                      accounts:
                          ref.watch(accountDataProvider).getAccountsByUser('1'),
                    )));
          case (AppRoutes.transfer):
            return MaterialPageRoute(
                builder: ((context) => TransferScreen(
                  accounts: ref.watch(accountDataProvider).getAccounts(),
                )));
          default:
            return MaterialPageRoute(
                builder: ((context) => HomeScreen(
                      user: ref.watch(userDataProvider).getUser("1"),
                      accounts:
                          ref.watch(accountDataProvider).getAccountsByUser('1'),
                    )));
        }
      },
    );
  }
}
