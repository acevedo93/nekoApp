
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/pomodoro/providers/pomodoro_state_provider.dart';
import 'package:nekonapp/presentation/state/user/provider/user_state_provider.dart';
import 'package:nekonapp/presentation/theme/theme.dart';

class PomodoroTimer extends ConsumerStatefulWidget {
  const PomodoroTimer({super.key});

  @override
  PomodoroTimerState createState() => PomodoroTimerState();
}

class PomodoroTimerState extends ConsumerState<PomodoroTimer> {
  String formatTimer() {
    var pomoTimeMin = ref.watch(pomodoroStateProvider).pomoTimeMin;
    var pomoTimeSec = ref.watch(pomodoroStateProvider).pomoTimeSec;

    return '${pomoTimeMin < 10 ? '0' : ''}$pomoTimeMin:${pomoTimeSec < 10 ? '0' : ''}$pomoTimeSec';
  }

  CupertinoButton _checkButtons(){

    return ref.watch(pomodoroStateProvider).isPomoActive
        ? CupertinoButton(
            onPressed: ref.read(pomodoroStateProvider.notifier).stop,
            child: const Icon(CupertinoIcons.stop, color: secondary,))
        : CupertinoButton(
            onPressed: ref.read(pomodoroStateProvider.notifier).play,
            child: const Icon(CupertinoIcons.play, color: secondary,),
          );
  }




  @override
  dispose() {
    ref.read(pomodoroStateProvider.notifier).stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final secondaryColor= Theme.of(context).secondaryHeaderColor;
    return Center(
        child: Column(
      children: [
        SizedBox(
          width: size.width,
          child: Center(
            child: Text(formatTimer(),
                style: TextStyle(
                  fontSize: 100,
                  color: secondaryColor,
                )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_checkButtons()],
        )
      ],
    ));
  }
}
