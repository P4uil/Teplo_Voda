part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogInRequested extends AuthEvent {
  final String email;
  final String password;

  const LogInRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;

  const RegisterRequested(this.email, this.password);
}

class LogOutRequested extends AuthEvent {}

class DeleteAccountRequested extends AuthEvent {} // Новое событие
