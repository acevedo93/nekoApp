import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  int pomoTimeMin = 25;
  int pomoTimeSec = 0;
  bool isPomoActive = false;
  Timer? _timerRef;
  Duration periodicRepeat = const Duration(seconds: 1);
  String formatTimer() =>
      '${pomoTimeMin < 10 ? '0' : ''}$pomoTimeMin:${pomoTimeSec < 10 ? '0' : ''}$pomoTimeSec';

  void stop() {
    if (_timerRef!.isActive) {
      _timerRef!.cancel();
      setState(() {
        isPomoActive = false;
      });
    }
  }

  finishTimer() {}

  void play() {
    _timerRef = Timer.periodic(periodicRepeat, (Timer timer) {
      if (pomoTimeMin == 0 && pomoTimeSec == 0) {
        finishTimer();
        return timer.cancel();
      }
      if (pomoTimeSec == 0) {
        pomoTimeSec = 59;
        pomoTimeMin--;
      } else {
        pomoTimeSec--;
      }
      isPomoActive = true;
      setState(() {});
    });
  }

  void removeTimerDependencies() {
    stop();
  }

    CupertinoButton _checkButtons() {
    return isPomoActive
        ? CupertinoButton(
            onPressed: stop, child: const Icon(CupertinoIcons.stop))
        : CupertinoButton(
            onPressed: play,
            child: const Icon(CupertinoIcons.play),
          );
  }

  @override
  dispose() {
    super.dispose();
    removeTimerDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
        child: Column(
      children: [
        SizedBox(
          width: size.width,
          child: Center(
            child: Text(formatTimer(),
                style: const TextStyle(
                  fontSize: 100,
                )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          _checkButtons() 
          ],
        )
      ],
    ));
  }
}
