import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/router/providers/router_provider.dart';
import 'package:nekonapp/presentation/theme/theme.dart';
import 'firebase_options.dart';

import "dart:developer" as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const 
  ProviderScope(
    child: MainApp())
  );

 
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.getTheme(),
    );
  }
  
  
}
