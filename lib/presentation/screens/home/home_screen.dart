import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/auth/providers/auth_state_provider.dart';
import 'package:nekonapp/presentation/widgets/pomodoroTimer/pomodoro_timer.dart';

import '../../widgets/pomodoroSettings/pomodoro_settings.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("focus"),
        leading: IconButton(
          onPressed: ref.read(authStateProvider.notifier).logOut,
          icon: Icon(Icons.exit_to_app),

        ) ,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          PomodoroTimer(),
          PomodoroSettings(), 
        ]),
      ),
    );
  }
}
