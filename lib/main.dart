import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nekonapp/router/router.dart';
import 'package:nekonapp/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MainApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.getTheme(),
    );
  }
}
