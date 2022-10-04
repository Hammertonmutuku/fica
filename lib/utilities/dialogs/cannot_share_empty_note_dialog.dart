import 'package:flutter/material.dart';
import 'package:fika/utilities/dialogs/generic_dialogs.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(context: context, title: 'sharing', content: 'You cannot share an empty note!', optionBuilder: () => {
   'Ok' : null,
  });
}