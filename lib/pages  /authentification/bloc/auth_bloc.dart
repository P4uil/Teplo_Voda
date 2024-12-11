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

        final isValid = await _authenticateUser(event.email, event.password);
        if (isValid) {
          emit(Authenticated());
        } else {
          emit(const AuthError("Неверный email или пароль"));
        }
      } catch (e) {
        emit(AuthError("Произошла ошибка: ${e.toString()}"));
      }
    });

    // Обработчик регистрации
    on<RegisterRequested>((event, emit) async {
      try {
        emit(AuthLoading());

        final isRegistered = await _registerUser(event.email, event.password);
        if (isRegistered) {
          emit(Authenticated());
        } else {
          emit(const AuthError("Регистрация не удалась"));
        }
      } catch (e) {
        emit(AuthError("Произошла ошибка: ${e.toString()}"));
      }
    });

    // Обработчик выхода
    on<LogOutRequested>((event, emit) async {
      emit(AuthLoading());
      await _logOutUser();
      emit(AuthInitial());
    });

    // Обработчик удаления аккаунта
    on<DeleteAccountRequested>((event, emit) async {
      try {
        emit(AuthLoading());

        // Имитация удаления аккаунта
        final isDeleted = await _deleteAccount();
        if (isDeleted) {
          emit(AuthInitial());
        } else {
          emit(const AuthError("Не удалось удалить аккаунт"));
        }
      } catch (e) {
        emit(AuthError("Произошла ошибка: ${e.toString()}"));
      }
    });
  }

  Future<bool> _authenticateUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return email == "user@example.com" && password == "password123";
  }

  Future<bool> _registerUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<void> _logOutUser() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<bool> _deleteAccount() async {
    await Future.delayed(const Duration(seconds: 2));
    // Имитация успешного удаления аккаунта
    return true; // Здесь добавьте логику удаления через API
  }
}
