import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(FirebaseAuth instance) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        // Симуляция логики входа
        await Future.delayed(const Duration(seconds: 2));
        emit(Authenticated());
      } catch (e) {
        emit(AuthError('Ошибка входа'));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        // Симуляция логики регистрации
        await Future.delayed(const Duration(seconds: 2));
        emit(Authenticated());
      } catch (e) {
        emit(AuthError('Ошибка регистрации'));
      }
    });
  }
}
