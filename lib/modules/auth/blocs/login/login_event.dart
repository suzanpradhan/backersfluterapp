part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginFormSubmit extends LoginEvent {
  final String username;
  final String password;

  const LoginFormSubmit({required this.username, required this.password});
  @override
  List<Object> get props => [username, password];
}

class UsernameValidate extends LoginEvent {
  final String? username;
  final LoginFormErrorState? errorState;
  const UsernameValidate({this.username, this.errorState});
  @override
  List<Object?> get props => [username, errorState];
}

class PasswordValidate extends LoginEvent {
  final String? password;
  final LoginFormErrorState? errorState;
  const PasswordValidate({this.password, this.errorState});

  @override
  List<Object?> get props => [password, errorState];
}
