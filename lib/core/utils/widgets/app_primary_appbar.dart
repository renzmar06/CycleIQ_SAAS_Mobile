import 'package:flutter/material.dart';

class AppPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool showBack;

  const AppPrimaryAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
    this.backgroundColor = Colors.green,
    this.showBack = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: showBack
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.white,
            )
          : null,

      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),

      actions: actions,
    );
  }
}
