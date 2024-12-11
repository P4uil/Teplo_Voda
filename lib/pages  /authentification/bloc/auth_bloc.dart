import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(FirebaseAuth instance) : super(AuthInitial()) {
    // Обработчик входа
    on<LogInRequested>((event, emit) async {
      try {
        emit(AuthLoading());

        // Имитация проверки учетных данных
        final isValid = await _authenticateUser(event.email, event.password);
        if (isValid) {
          emit(Authenticated());
        } else {
          emit(AuthError("Неверный email или пароль"));
        }
      } catch (e) {
        emit(AuthError("Произошла ошибка: ${e.toString()}"));
      }
    });

    // Обработчик регистрации
    on<RegisterRequested>((event, emit) async {
      try {
        emit(AuthLoading());

        // Имитация регистрации пользователя
        final isRegistered = await _registerUser(event.email, event.password);
        if (isRegistered) {
          emit(Authenticated());
        } else {
          emit(AuthError("Регистрация не удалась"));
        }
      } catch (e) {
        emit(AuthError("Произошла ошибка: ${e.toString()}"));
      }
    });

    // Обработчик выхода
    on<LogOutRequested>((event, emit) async {
      emit(AuthLoading());

      // Имитация выхода пользователя
      await _logOutUser();

      emit(AuthInitial());
    });
  }

  Future<bool> _authenticateUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    // Имитация проверки через API
    return email == "user@example.com" && password == "password123";
  }

  Future<bool> _registerUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    // Имитация успешной регистрации
    return true; // Здесь добавьте логику взаимодействия с API
  }

  Future<void> _logOutUser() async {
    await Future.delayed(const Duration(seconds: 1));
    // Очистка данных сессии
  }
}
