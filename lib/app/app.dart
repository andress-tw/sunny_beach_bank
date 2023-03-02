import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunny_beach_bank/ui/screens/new_home_screen.dart';

class SunnyBeachBankApp extends ConsumerWidget {
  const SunnyBeachBankApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(home: NewHomeScreen());
  }
}
