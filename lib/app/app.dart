import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/config/app_theme.dart';
import 'package:sunny_beach_bank/config/routes/app_routes.dart';
import 'package:sunny_beach_bank/config/data_provider.dart';
import 'package:sunny_beach_bank/domain/use_cases/account_data.dart';
import 'package:sunny_beach_bank/domain/use_cases/user_data.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/account_data_api.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/user_data_api.dart';
import 'package:sunny_beach_bank/ui/screens/home_screen.dart';
import 'package:sunny_beach_bank/ui/screens/transfer_screen.dart';
import 'package:provider/provider.dart';

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => DataProvider(
          UserDataUseCase(UserDataApi()), AccountDataUseCase(AccountDataApi())
        )), lazy: false,)
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
            builder: ((context) =>  const HomeScreen())
          );
          case (AppRoutes.transfer):
          return MaterialPageRoute(
            builder: ((context) => TransferScreen())
          );
          default:
          return MaterialPageRoute(
            builder: ((context) =>  const HomeScreen())
          );
        }
      }
    );
  }
}
