import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  bool start = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @action
  void startTime() {
    start = true;
  }

  @action
  void stopTime() {
    start = false;
  }

  @action
  void restartTime() {
    start = false;
  }

  @action
  void increaseWorkTime() {
    workTime++;
  }

  @action
  void decreaseWorkTime() {
    workTime--;
  }

  @action
  void increaseRestTime() {
    restTime++;
  }

  @action
  void decreaseRestTime() {
    restTime--;
  }
}
