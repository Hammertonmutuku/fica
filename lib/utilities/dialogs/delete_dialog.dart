
import 'package:flutter/material.dart';
import 'package:fika/utilities/dialogs/generic_dialogs.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete',
    content: 'Are you sure you want to delete ',
    optionBuilder: () => {
      'cancel': false,
      'Delete': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
