
import 'package:flutter/material.dart';
import 'package:fika/utilities/dialogs/generic_dialogs.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Log out',
    content: 'Are you sure you want to log out ',
    optionBuilder: () => {
      'cancel': false,
      'logout': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
