part of 'drawer_bloc.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object> get props => [];
}

class DrawerInitial extends DrawerState {}

class DrawerNavigationState extends DrawerState {
  final String screen;

  const DrawerNavigationState({required this.screen});

  @override
  List<Object> get props => [screen];
}
