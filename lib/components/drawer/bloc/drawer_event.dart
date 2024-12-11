part of 'drawer_bloc.dart';

abstract class DrawerEvent extends Equatable {
  const DrawerEvent();

  @override
  List<Object> get props => [];
}

class DrawerNavigationEvent extends DrawerEvent {
  final String screen;

  const DrawerNavigationEvent({required this.screen});

  @override
  List<Object> get props => [screen];
}
