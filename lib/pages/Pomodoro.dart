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

    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Stopwatch(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      EntryTime(
                        title: 'Work',
                        value: store.workTime,
                        increase: store.increaseWorkTime,
                        decrease: store.decreaseWorkTime,
                      ),
                      EntryTime(
                        title: 'Rest',
                        value: store.restTime,
                        increase: store.increaseRestTime,
                        decrease: store.decreaseRestTime,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
