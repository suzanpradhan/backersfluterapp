import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController usernameController;
  final TextEditingController passowrdController;

  LoginBloc(
      {required this.passowrdController, required this.usernameController})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<UsernameValidate>((event, emit) => validateUsername(
        username: event.username, errorState: event.errorState, emit: emit));
    on<PasswordValidate>((event, emit) => validatePassword(
        password: event.password, errorState: event.errorState, emit: emit));
  }

  validateUsername(
      {String? username,
      LoginFormErrorState? errorState,
      required Emitter<LoginState> emit}) {
    if (username == null || username == "") {
      emit(LoginFormErrorState(
          passwordError: (errorState != null) ? errorState.passwordError : null,
          usernameError: "Username must have at least 8 characters."));
    } else if (username.startsWith(RegExp(r'[A-Z]'))) {
      emit(LoginFormErrorState(
          passwordError: (errorState != null) ? errorState.passwordError : null,
          usernameError: "Username must start with lowercase."));
    } else if (username.startsWith(RegExp(r'[0-9]'))) {
      emit(LoginFormErrorState(
          passwordError: (errorState != null) ? errorState.passwordError : null,
          usernameError: "Username must start with a alphabet."));
    } else if (username.length < 8) {
      emit(LoginFormErrorState(
          passwordError: (errorState != null) ? errorState.passwordError : null,
          usernameError: "Username must have at least 8 characters."));
    } else {
      if (errorState != null) {
        if (errorState.passwordError == null &&
            usernameController.text != "" &&
            passowrdController.text != "") {
          emit(LoginFormValidated());
        } else {
          emit(LoginFormErrorState(
              passwordError: errorState.passwordError, usernameError: null));
        }
      } else if (usernameController.text != "" &&
          passowrdController.text != "") {
        emit(LoginFormValidated());
      }
    }
  }

  validatePassword(
      {String? password,
      LoginFormErrorState? errorState,
      required Emitter<LoginState> emit}) {
    if (password == null || password == "" || password.length < 6) {
      emit(LoginFormErrorState(
          usernameError: (errorState != null) ? errorState.usernameError : null,
          passwordError: "Password must have at least 6 characters."));
    } else {
      if (errorState != null) {
        if (errorState.usernameError == null &&
            usernameController.text != "" &&
            passowrdController.text != "") {
          emit(LoginFormValidated());
        } else {
          emit(LoginFormErrorState(
              usernameError: errorState.usernameError, passwordError: null));
        }
      } else if (usernameController.text != "" &&
          passowrdController.text != "") {
        emit(LoginFormValidated());
      }
    }
  }
}
