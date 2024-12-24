import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final TextTheme? textTheme;
  final bool centerTitle;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? appBarHeight; // New property

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.bottom,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.textTheme,
    this.centerTitle = true,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.appBarHeight, // New property
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
      bottom: bottom,
      elevation: elevation,
      backgroundColor: backgroundColor ??
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      centerTitle: centerTitle,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/leaf.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.04), // Adjust the opacity here
              BlendMode.dstATop,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(
      appBarHeight ??
          kToolbarHeight +
              (bottom?.preferredSize.height ?? 0.0), // Modified line
    );
  }
}
