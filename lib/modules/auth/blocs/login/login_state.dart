part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginFormErrorState extends LoginState {
  final String? usernameError;
  final String? passwordError;

  const LoginFormErrorState({this.usernameError, this.passwordError});

  @override
  List<Object?> get props => [usernameError, passwordError];

  hasUsernameError() => (usernameError == null);
  hasPasswordError() => (passwordError == null);
}

class LoginFormValidated extends LoginState {}
