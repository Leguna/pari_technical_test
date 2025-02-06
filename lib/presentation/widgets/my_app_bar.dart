import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.title = const Text(''),
    this.actions = const [],
    this.bottom,
    this.useDivider = true,
  });

  final Widget title;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final bool useDivider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: title,
        actions: actions,
        bottom: useDivider
            ? PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            width: double.infinity,
            height: 0.5,
            color: Colors.grey,
          ),
        )
            : bottom,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
