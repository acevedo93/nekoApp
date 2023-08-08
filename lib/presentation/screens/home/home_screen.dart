import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/auth/providers/auth_state_provider.dart';
import 'package:nekonapp/presentation/state/pomodoro/providers/pomodoro_state_provider.dart';
import 'package:nekonapp/presentation/state/theme/provider/theme_state_provider.dart';
import 'package:nekonapp/presentation/state/user/provider/user_state_provider.dart';
import 'package:nekonapp/presentation/widgets/loader/loader.dart';
import 'package:nekonapp/presentation/widgets/pomodoroTimer/pomodoro_timer.dart';

import '../../widgets/pomodoroSettings/pomodoro_settings.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final secondary = Theme.of(context).secondaryHeaderColor;
    final userIsLoading = ref.watch(userStateProvider).isLoading;
    final pomoIsActive = ref.watch(pomodoroStateProvider).isPomoActive;
    final pomodoroIsLoading = ref.watch(pomodoroStateProvider).isLoading;

    Widget renderWidgets() {
      if (userIsLoading || pomodoroIsLoading) {
        return Center(child: Loader(size: 40, color: secondary));
      }
      return Column(children: [
        const PomodoroTimer(),
        if (!pomoIsActive) const PomodoroSettings(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          
            ElevatedButton(
                onPressed: () => {
                      ref
                          .read(themeStateProvider.notifier)
                          .setColors(Color(0xFFfaf931), Color(0xFF8a2be2))
                    },
                child: Icon(Icons.change_circle)),
            ElevatedButton(
                onPressed: () => {
                      ref
                          .read(themeStateProvider.notifier)
                          .setColors(Color(0xFFeeeeee), Color(0xFF114a02))
                    },
                child: Icon(Icons.change_circle)),
                ElevatedButton(
                onPressed: () => {
                      ref
                          .read(themeStateProvider.notifier)
                          .setColors(Color(0xFFb2f9b1), Color(0xFF5f006d))
                    },
                child: Icon(Icons.change_circle)),
            ElevatedButton(
                onPressed: () => {
                      ref
                          .read(themeStateProvider.notifier)
                          .setColors(Color(0xFF000080), Color(0xFF05f278))
                    },
                child: Icon(Icons.change_circle)),
            
        ],)
       
 
      ]);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("focus"),
          leading: IconButton(
            onPressed: ref.read(authStateProvider.notifier).logOut,
            icon: const Icon(Icons.exit_to_app),
          ),

        ),
        body: renderWidgets());
  }
}
