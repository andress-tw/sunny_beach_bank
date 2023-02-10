import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/config/app_theme.dart';
import 'package:sunny_beach_bank/config/routes/app_routes.dart';
import 'package:sunny_beach_bank/config/data_provider.dart';
import 'package:sunny_beach_bank/ui/screens/home_screen.dart';
import 'package:sunny_beach_bank/ui/screens/transfer_screen.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => DataProvider()), lazy: false,)
      ],
      child: const SunnyBeachBankApp(),
    );
  }
}

class SunnyBeachBankApp extends StatelessWidget {
  const SunnyBeachBankApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: AppTheme.lightTheme,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case (AppRoutes.home):
          return MaterialPageRoute(
            builder: ((context) => const HomeScreen())
          );
          case (AppRoutes.transfer):
          return MaterialPageRoute(
            builder: ((context) => TransferScreen())
          );
          default:
          return MaterialPageRoute(
            builder: ((context) => const HomeScreen())
          );
        }
      }
    );
  }
}
