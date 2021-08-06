import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/StopwatchButton.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) => Container(
        color: store.isWorking() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              store.isWorking() ? 'Time to Work' : 'Time to Rest',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: 120,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!store.start)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: StopwatchButton(
                      text: 'Start',
                      icon: Icons.play_arrow,
                      handleClick: store.startTime,
                    ),
                  ),
                if (store.start)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: StopwatchButton(
                      text: 'Stop',
                      icon: Icons.stop,
                      handleClick: store.stopTime,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: StopwatchButton(
                    text: 'Refresh',
                    icon: Icons.refresh,
                    handleClick: store.restartTime,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
