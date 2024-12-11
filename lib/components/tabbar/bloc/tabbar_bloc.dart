library tabbar_bloc; // Название библиотеки

import 'package:bloc/bloc.dart';

part 'tabbar_event.dart'; // Подключение части
part 'tabbar_state.dart'; // Подключение части

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarInitial()) {
    on<SwitchTabEvent>((event, emit) {
      emit(TabBarState(selectedIndex: event.index));
    });
  }
}
