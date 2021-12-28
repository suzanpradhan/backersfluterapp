import 'dart:ui';

import 'package:backersapp/constants/assets_path.dart';
import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/enums/auth_text_types.dart';
import 'package:backersapp/modules/auth/blocs/login/login_bloc.dart';
import 'package:backersapp/modules/auth/screens/register_screen.dart';
import 'package:backersapp/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusNodeUserName = FocusNode();
  FocusNode focusNodePassword = FocusNode();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
          usernameController: _usernameController,
          passowrdController: _usernameController),
      child: Scaffold(
        backgroundColor: CustomColors.darkBlue,
        body: Stack(
          children: [
            Image.asset(
              AssetsPath.authBackground,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 24),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 12,
                              sigmaY: 12,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5,
                                      color: CustomColors.darkBlueShade),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "FFMarkBlack",
                                        color: CustomColors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  BlocBuilder<LoginBloc, LoginState>(
                                    builder: (context, state) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: AuthTextField(
                                              textEditingController:
                                                  _usernameController,
                                              focusNode: focusNodeUserName,
                                              hintText: "Username",
                                              errorMessage: (state
                                                          is LoginFormErrorState &&
                                                      !state.hasUsernameError())
                                                  ? state.usernameError
                                                  : null,
                                              onChanged: (value) {
                                                BlocProvider.of<LoginBloc>(
                                                        context)
                                                    .add(UsernameValidate(
                                                        errorState: (state
                                                                is LoginFormErrorState)
                                                            ? state
                                                            : null,
                                                        username: value));
                                              },
                                              authTextTypes:
                                                  AuthTextTypes.username));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  BlocBuilder<LoginBloc, LoginState>(
                                    builder: (context, state) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: AuthTextField(
                                              textEditingController:
                                                  _passwordController,
                                              focusNode: focusNodePassword,
                                              hintText: "Password",
                                              errorMessage: (state
                                                          is LoginFormErrorState &&
                                                      !state.hasPasswordError())
                                                  ? state.passwordError
                                                  : null,
                                              onChanged: (value) {
                                                BlocProvider.of<LoginBloc>(
                                                        context)
                                                    .add(PasswordValidate(
                                                        errorState: (state
                                                                is LoginFormErrorState)
                                                            ? state
                                                            : null,
                                                        password: value));
                                              },
                                              authTextTypes:
                                                  AuthTextTypes.password));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Text(
                                            "Can't Sign In?".toUpperCase(),
                                            style: const TextStyle(
                                                color:
                                                    CustomColors.darkBlueShade,
                                                fontFamily: "FFMarkRegular",
                                                fontSize: 12)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Center(
                                                child: Image.asset(
                                                    AssetsPath.facebookIcon,
                                                    width: 18,
                                                    height: 18)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 32,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Center(
                                                child: Image.asset(
                                                    AssetsPath.googleIcon,
                                                    width: 16,
                                                    height: 16)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 38,
                                  ),
                                  BlocBuilder<LoginBloc, LoginState>(
                                    builder: (context, state) {
                                      return InkWell(
                                        onTap: () {},
                                        borderRadius: BorderRadius.circular(14),
                                        child: Container(
                                          width: 54,
                                          height: 54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: (state
                                                          is LoginFormValidated)
                                                      ? CustomColors.greenAccent
                                                      : CustomColors
                                                          .darkBlueShade),
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: (state is LoginFormValidated)
                                                ? CustomColors.greenAccent
                                                : CustomColors.darkBlueShade,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 28,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const RegisterScreen()),
                                      );
                                    },
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      child: Text(
                                          "Create Account".toUpperCase(),
                                          style: const TextStyle(
                                            color: CustomColors.darkBlueShade,
                                            fontFamily: "FFMarkMedium",
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    "Terms and Conditions".toUpperCase(),
                    style: const TextStyle(
                        color: CustomColors.darkBlueShade,
                        fontFamily: "FFMarkMedium",
                        fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
