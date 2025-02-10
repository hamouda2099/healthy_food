import 'dart:io';

import 'package:flutter/material.dart';


Future<void> navigator({
  required BuildContext context,
  required Widget screen,
  bool remove = false,
  bool replacement = false,
}) async {
  try {
      if (remove) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) {
          return screen;
        }), (Route<dynamic> route) => false);
      } else if (replacement) {
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (_) {
            return screen;
          },
        ));
      } else {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(
          builder: (_) {
            return screen;
          },
        ));
      }
  } on SocketException catch (_) {
    Navigator.pop(context);
  }
}
