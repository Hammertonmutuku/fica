import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fika/constants/routes.dart';
import 'package:fika/services/auth/auth_service.dart';
import 'package:fika/services/auth/bloc/auth_bloc.dart';
import 'package:fika/services/auth/bloc/auth_event.dart';

class EmailVerficationView extends StatefulWidget {
  const EmailVerficationView({Key? key}) : super(key: key);

  @override
  State<EmailVerficationView> createState() => _EmailVerficationViewState();
}

class _EmailVerficationViewState extends State<EmailVerficationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('verify email')),
      body: Column(children: [
        const Text(
            "We've sent you an email verfication please check you mail "),
        const Text(
            "if you've not received the email please click here to resend the verification mail "),
        TextButton(
          onPressed: ()  {
            context.read<AuthBloc>().add(const AuthEventSendEmailVerification());
          },
          child: const Text('resend email verification'),
        ),
        TextButton(
            onPressed: ()  {
             context.read<AuthBloc>().add(const AuthEventLogout());
            },
            child: const Text('Restart')),
      ]),
    );
  }
}
