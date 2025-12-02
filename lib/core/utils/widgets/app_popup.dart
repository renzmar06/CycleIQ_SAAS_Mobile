import 'package:flutter/material.dart';

class AppPopup {
  /// SUCCESS POPUP (Green)
  static void showSuccess(BuildContext context, String message) {
    _show(context, message, Colors.green);
  }

  /// ERROR POPUP (Red)
  static void showError(BuildContext context, String message) {
    _show(context, message, Colors.red);
  }

  /// WARNING POPUP (Orange)
  static void showWarning(BuildContext context, String message) {
    _show(context, message, Colors.orange);
  }

  /// INFO POPUP (Blue)
  static void showInfo(BuildContext context, String message) {
    _show(context, message, Colors.blue);
  }

  /// BASE POPUP
  static void _show(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        content: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*

///Use Cases

///Success
AppPopup.showSuccess(context, "Profile updated!");

///Error
AppPopup.showError(context, "Failed to update profile");

///Warning
AppPopup.showWarning(context, "Please check your details");

///Info
AppPopup.showInfo(context, "Fetching data...");
*/