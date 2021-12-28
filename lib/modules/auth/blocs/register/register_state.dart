part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterFormErrorState extends RegisterState {
  final String? usernameError;
  final String? emailAddressError;
  final String? passwordError;

  const RegisterFormErrorState(
      {this.usernameError, this.passwordError, this.emailAddressError});

  @override
  List<Object?> get props => [usernameError, passwordError, emailAddressError];

  hasUsernameError() => (usernameError == null);
  hasPasswordError() => (passwordError == null);
  hasEmailAddressError() => (emailAddressError == null);
}

class RegisterFormValidated extends RegisterState {}
