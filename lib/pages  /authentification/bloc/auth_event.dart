part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// Событие для входа
class LogInRequested extends AuthEvent {
  final String email;
  final String password;

  const LogInRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

// Событие для регистрации
class RegisterRequested extends AuthEvent {
  final String email;
  final String password;

  const RegisterRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

// Событие для выхода
class LogOutRequested extends AuthEvent {}
