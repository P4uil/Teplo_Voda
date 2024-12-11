part of 'tabbar_bloc.dart'; // Указывает, что это часть библиотеки tabbar_bloc

class TabBarState {
  final int selectedIndex;

  TabBarState({required this.selectedIndex});
}

class TabBarInitial extends TabBarState {
  TabBarInitial() : super(selectedIndex: 0);
}
