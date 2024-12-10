part of 'drawer_bloc.dart';

abstract class DrawerEvent extends Equatable {
  const DrawerEvent();

  @override
  List<Object> get props => [];
}

class NavigateToScreen extends DrawerEvent {
  final String screen;

  const NavigateToScreen(this.screen);

  @override
  List<Object> get props => [screen];
}
