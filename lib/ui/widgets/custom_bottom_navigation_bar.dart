import 'package:ecommerce/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_badge/icon_badge.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = ref.watch(navigationProvider);
    var itemsCount = ref.watch(cartProvider);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(size: 24),
      iconSize: 18,
      onTap: (index) {
        currentIndex = index;
        ref.read(navigationProvider.notifier).selectPage(index);
      },
      currentIndex: currentIndex,
      items: [
        const BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            FontAwesomeIcons.home,
          ),
        ),
        const BottomNavigationBarItem(
          label: 'News',
          icon: Icon(
            Icons.feed,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Shop',
          icon: IconBadge(
            top: 0,
            right: 0,
            icon: const Icon(Icons.shopping_cart_rounded),
            itemCount: itemsCount,
            badgeColor: Colors.black54,
          ),
        ),
        const BottomNavigationBarItem(
          label: 'Altro',
          icon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
