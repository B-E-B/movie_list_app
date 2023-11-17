import 'package:flutter/material.dart';
import 'package:movie_list_app/common/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? leading;

  final bool? centerTitle;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backgroundColor = AppColors.background,
    this.centerTitle = false,
    this.leading,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: leading,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: title,
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }
}
