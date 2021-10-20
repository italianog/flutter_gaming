import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool goBack;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Widget? trailing;
  const CustomAppBar({
    Key? key,
    this.title,
    this.goBack = false,
    this.titleStyle,
    this.backgroundColor,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: goBack ? 48 : 0,
      centerTitle: true,
      title: title != null
          ? Text(
              title!,
              style: titleStyle,
            )
          : const SizedBox.shrink(),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leading: goBack
          ? IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : const SizedBox.shrink(),
      actions: [
        trailing ?? const SizedBox.shrink(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
