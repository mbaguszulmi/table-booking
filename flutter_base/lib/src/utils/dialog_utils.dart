import 'package:flutter/material.dart';
import 'package:flutter_base/src/helpers/navigator_helper.dart';

Future<T?> revealDialog<T>({
  BuildContext? context,
  String? titleText,
  String? bodyText,
  String? positiveText,
  String? negativeText,
  bool cancelable = true,
  void Function()? onPositiveClicked,
  void Function()? onNegativeClicked,
}) async {
  if (context == null && AppNavigator.navigatorKey.currentContext == null) {
    return null;
  }

  if (context == null && AppNavigator.navigatorKey.currentContext != null) {
    context = AppNavigator.navigatorKey.currentContext;
  }

  return showDialog(
    context: context!,
    builder: (context) {
      return AlertDialog(
        title: Text(titleText ?? "Alert!"),
        content: Text(bodyText ?? ""),
        actions: <Widget>[
          TextButton(
            child: Text(negativeText ?? "Dismiss"),
            onPressed: onNegativeClicked ??
                () {
                  Navigator.of(context).pop();
                },
          ),
          ...(positiveText != null
              ? [
                  TextButton(
                    child: Text(positiveText),
                    onPressed: onPositiveClicked ??
                        () {
                          Navigator.of(context).pop();
                        },
                  )
                ]
              : []),
        ],
      );
    },
    barrierDismissible: cancelable,
  );
}

Future<T?> customDialog<T>({
  BuildContext? context,
  required Widget child,
  bool cancelable = true,
}) async {
  if (context == null && AppNavigator.navigatorKey.currentContext == null) {
    return null;
  }

  if (context == null && AppNavigator.navigatorKey.currentContext != null) {
    context = AppNavigator.navigatorKey.currentContext;
  }
  return showDialog(
    context: context!,
    barrierDismissible: cancelable,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    ),
  );
}
