import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:flutter/material.dart';

class AppCenterPopup {
  /// Show popup (auto dismiss + optional buttons)
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    String actionText = "OK",
    VoidCallback? onAction,
    bool showCancel = false,
    int autoCloseSeconds = 0, // 0 = don't auto close
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, _, _) {
        // Auto dismiss logic
        if (autoCloseSeconds > 0) {
          Future.delayed(Duration(seconds: autoCloseSeconds), () {
            AppNav.pop(context);
          });
        }

        return SafeArea(
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Message
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Action Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          onAction?.call();
                        },
                        child: Text(
                          actionText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // Cancel button (optional)
                    if (showCancel) ...[
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },

      // Animation
      transitionBuilder: (_, anim, __, child) {
        return Transform.scale(
          scale: anim.value,
          child: Opacity(opacity: anim.value, child: child),
        );
      },
    );
  }
}

/*
/// Use Cases

///Simple popup (auto dismiss after 2 sec)
AppCenterPopup.show(
  context,
  title: "Success",
  message: "Profile updated!",
  autoCloseSeconds: 2,
);

///Popup with Action Button
AppCenterPopup.show(
  context,
  title: "Profile Updated",
  message: "Your changes have been saved successfully.",
  actionText: "OK",
  onAction: () {
    print("Action clicked");
  },
);

///Popup with Action + Cancel
AppCenterPopup.show(
  context,
  title: "Delete Account?",
  message: "This action cannot be undone.",
  actionText: "Delete",
  showCancel: true,
  onAction: () {
    // Perform delete
  },
);
 */
