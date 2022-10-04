import 'package:fika/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fika/services/auth/auth_exceptions.dart';
import 'package:fika/services/auth/bloc/auth_bloc.dart';
import 'package:fika/services/auth/bloc/auth_event.dart';
import 'package:fika/services/auth/bloc/auth_state.dart';
import 'package:fika/utilities/dialogs/error_dialog.dart';

import '../Components/Login/email_text_field.dart';
import '../Components/Login/password_text_field.dart';
import '../Components/Login/size_box.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(
                context, 'Could not find user with the entered credentials!');
          } else if (state.exception is WrongPasswordAuthException) {
            await showErrorDialog(context, 'wrong credentials');
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, 'Authentication error');
          }
        }
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: kPrimaryColor,
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                height: 300,
                width: 500,
                child: Image.asset(
                  'assets/images/ficalogo.png',
                ),
              ),
              const Text(
                'Sign in ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizeBox(),
              EmailTextField(emailController: _email),
              const SizeBox(),
              PasswordTextField(passwordController: _password),
         
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  TextButton(
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(const AuthEventForgotPassword());
                      },
                      child: const Text('Forgot password ?', style: TextStyle(color: Colors.white),)),
                ],
              ),
      
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                key: const Key('login'),
                child: MaterialButton(
                  minWidth: w,
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    context.read<AuthBloc>().add(
                          AuthEventLogIn(
                            email,
                            password,
                          ),
                        );
                  },
                  child: const Text(
                    'login',
                    style: TextStyle(
                      color: kTextClor,
                      fontSize: 16,
                      // color: Colors.black87,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ])),
          ),
        ),

        // body: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     children: [
        //       const Text(
        //         'If you forgot your password, simply enter ypur email and we will send you a password'),
        //       TextField(
        //         controller: _email,
        //         enableSuggestions: false,
        //         autocorrect: false,
        //         keyboardType: TextInputType.emailAddress,
        //         decoration: const InputDecoration(
        //           hintText: 'Enter your email here',
        //         ),
        //       ),
        //       TextField(
        //         controller: _password,
        //         obscureText: true,
        //         enableSuggestions: false,
        //         autocorrect: false,
        //         decoration: const InputDecoration(
        //           hintText: 'Enter your password here',
        //         ),
        //       ),
        //       TextButton(
        //         onPressed: () async {
        //           final email = _email.text;
        //           final password = _password.text;
        //           context.read<AuthBloc>().add(
        //                 AuthEventLogIn(
        //                   email,
        //                   password,
        //                 ),
        //               );
        //         },
        //         child: const Text('Login'),
        //       ),
        //        TextButton(
        //           onPressed: () {
        //             context.read<AuthBloc>().add( const AuthEventForgotPassword());
        //           },
        //           child: const Text('Forgot password')),
        //       TextButton(
        //           onPressed: () {
        //             context.read<AuthBloc>().add(const AuthEventShouldRegister());
        //           },
        //           child: const Text('Register')),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
