import 'package:flutter/material.dart';
import 'package:fika/utilities/dialogs/generic_dialogs.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password Rest',
    content: 'We now sent you a password reset link. please check your email for more information',
    optionBuilder: () => {
      'OK' :null,
    } ,
  );
}
