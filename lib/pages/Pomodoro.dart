import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/EntryTime.dart';
import 'package:pomodoro/components/Stopwatch.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stopwatch(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EntryTime(
                      title: 'Work',
                      value: store.workTime,
                      increase: store.start && store.isWorking()
                          ? null
                          : store.increaseWorkTime,
                      decrease: store.start && store.isWorking()
                          ? null
                          : store.decreaseWorkTime,
                    ),
                    EntryTime(
                      title: 'Rest',
                      value: store.restTime,
                      increase: store.start && store.isResting()
                          ? null
                          : store.increaseRestTime,
                      decrease: store.start && store.isResting()
                          ? null
                          : store.decreaseRestTime,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
