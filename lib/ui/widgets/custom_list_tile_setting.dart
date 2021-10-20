import 'package:flutter/material.dart';

class CustomListTileSetting extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  const CustomListTileSetting({
    required this.icon,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Colors.white,
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Text(title),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
