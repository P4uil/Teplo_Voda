part of 'tabbar_bloc.dart'; // Указывает, что это часть библиотеки tabbar_bloc

abstract class TabBarEvent {}

class SwitchTabEvent extends TabBarEvent {
  final int index;

  SwitchTabEvent(this.index);
}
