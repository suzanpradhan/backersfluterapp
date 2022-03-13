import 'dart:ui';

import 'package:backersapp/constants/assets_path.dart';
import 'package:backersapp/constants/custom_colors.dart';
import 'package:backersapp/constants/enums/auth_text_types.dart';
import 'package:backersapp/modules/auth/blocs/register/register_bloc.dart';
import 'package:backersapp/modules/auth/models/user_model.dart';
import 'package:backersapp/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FocusNode _usernameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(
          emailController: _emailController,
          passowrdController: _passwordController,
          usernameController: _usernameController),
      child: Builder(builder: (context) {
        return BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is UserRegisterFailedState) {
              print("oleoleole");
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is RegisterAttemptLoadingState) {
              print("loading..................");
            } else if (state is UserRegisteredState) {
              print("logged in");
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
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
                                        "Create Account",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "FFMarkBlack",
                                            color: CustomColors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      BlocBuilder<RegisterBloc, RegisterState>(
                                        builder: (context, state) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: AuthTextField(
                                                  textEditingController:
                                                      _usernameController,
                                                  focusNode: _usernameNode,
                                                  onChanged: (value) {
                                                    BlocProvider.of<
                                                                RegisterBloc>(
                                                            context)
                                                        .add(UsernameValidate(
                                                            errorState: (state
                                                                    is RegisterFormErrorState)
                                                                ? state
                                                                : null,
                                                            username: value));
                                                  },
                                                  errorMessage: (state
                                                              is RegisterFormErrorState &&
                                                          !state
                                                              .hasUsernameError())
                                                      ? state.usernameError
                                                      : null,
                                                  hintText: "Username",
                                                  authTextTypes:
                                                      AuthTextTypes.username));
                                        },
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      BlocBuilder<RegisterBloc, RegisterState>(
                                        builder: (context, state) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: AuthTextField(
                                                  textEditingController:
                                                      _emailController,
                                                  focusNode: _emailNode,
                                                  onChanged: (value) {
                                                    BlocProvider.of<
                                                                RegisterBloc>(
                                                            context)
                                                        .add(EmailValidate(
                                                            errorState: (state
                                                                    is RegisterFormErrorState)
                                                                ? state
                                                                : null,
                                                            emailAddress:
                                                                value));
                                                  },
                                                  errorMessage: (state
                                                              is RegisterFormErrorState &&
                                                          !state
                                                              .hasEmailAddressError())
                                                      ? state.emailAddressError
                                                      : null,
                                                  hintText: "Email Address",
                                                  authTextTypes: AuthTextTypes
                                                      .emailAddress));
                                        },
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      BlocBuilder<RegisterBloc, RegisterState>(
                                        builder: (context, state) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: AuthTextField(
                                                  textEditingController:
                                                      _passwordController,
                                                  focusNode: _passwordNode,
                                                  onChanged: (value) {
                                                    BlocProvider.of<
                                                                RegisterBloc>(
                                                            context)
                                                        .add(PasswordValidate(
                                                            errorState: (state
                                                                    is RegisterFormErrorState)
                                                                ? state
                                                                : null,
                                                            password: value));
                                                  },
                                                  errorMessage: (state
                                                              is RegisterFormErrorState &&
                                                          !state
                                                              .hasPasswordError())
                                                      ? state.passwordError
                                                      : null,
                                                  hintText: "Password",
                                                  authTextTypes:
                                                      AuthTextTypes.password));
                                        },
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
                                                        BorderRadius.circular(
                                                            3)),
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
                                      BlocBuilder<RegisterBloc, RegisterState>(
                                        builder: (context, state) {
                                          return InkWell(
                                            onTap: () {
                                              BlocProvider.of<RegisterBloc>(
                                                      context)
                                                  .add(RegisterFormSubmitted(
                                                      userModel: UserModel(
                                                          username:
                                                              _usernameController
                                                                  .text,
                                                          email:
                                                              _emailController
                                                                  .text,
                                                          password:
                                                              _passwordController
                                                                  .text)));
                                            },
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            child: Container(
                                              width: 54,
                                              height: 54,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: (state
                                                              is RegisterFormValidated)
                                                          ? CustomColors
                                                              .greenAccent
                                                          : CustomColors
                                                              .darkBlueShade),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14)),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: (state
                                                        is RegisterFormValidated)
                                                    ? CustomColors.greenAccent
                                                    : CustomColors
                                                        .darkBlueShade,
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
                                          Navigator.pop(context);
                                        },
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14),
                                          child: Text(
                                              "Already have an account?"
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                color:
                                                    CustomColors.darkBlueShade,
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
                        style: TextStyle(
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
      }),
    );
  }
}
