
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/pomodoro/providers/pomodoro_state_provider.dart';

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


  @override
  dispose() {
    ref.read(pomodoroStateProvider.notifier).stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final secondaryColor= Theme.of(context).secondaryHeaderColor;


  CupertinoButton _checkButtons(){

    return ref.watch(pomodoroStateProvider).isPomoActive
        ? CupertinoButton(
            onPressed: ref.read(pomodoroStateProvider.notifier).stop,
            child:  Icon(CupertinoIcons.stop, color: secondaryColor,))
        : CupertinoButton(
            onPressed: ref.read(pomodoroStateProvider.notifier).play,
            child:  Icon(CupertinoIcons.play, color: secondaryColor),
          );
  }
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
