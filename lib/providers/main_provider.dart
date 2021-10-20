import 'package:ecommerce/models/article.dart';
import 'package:ecommerce/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final gamesProvider = Provider(
  (_) => [
    Item(
      id: '1',
      name: 'Crash Bandicoot 4',
      price: 2.99,
      rating: 5.0,
      imgUrl:
          'https://www.lascimmiapensa.com/wp-content/uploads/2020/09/Crash-4_-A-Bandicoot-for-a-New-Generation-00-03-10-.png',
    ),
    Item(
        id: '2',
        name: 'Resident Evil',
        price: 1.59,
        rating: 4.5,
        imgUrl:
            'https://sm.ign.com/t/ign_it/screenshot/default/resident-evil-village-147562_7w5b.2560.jpg'),
  ],
);

final newsProvider = Provider(
  (_) => [
    Article(
      title: 'Crash Bandicoot 4',
      date: DateTime.parse(DateTime.now().toIso8601String()),
      id: '1',
      text: 'Crash Bandicoot 4',
      imgUrl:
          'https://www.lascimmiapensa.com/wp-content/uploads/2020/09/Crash-4_-A-Bandicoot-for-a-New-Generation-00-03-10-.png',
    ),
    Article(
        title: 'Fair Cry 6',
        date: DateTime.parse(DateTime.now().toIso8601String()),
        id: '1',
        text: 'Crash Bandicoot 4',
        imgUrl:
            'https://store-images.s-microsoft.com/image/apps.35633.14422109142805611.71c71dc7-fe47-4083-ad56-ab54c9a5607d.7fb1718a-06e2-4757-bc3f-8c5571e7a9a8?mode=scale&q=90&h=1080&w=1920&background=%23FFFFFF'),
    Article(
      title: 'NBA 2K22',
      date: DateTime.parse(DateTime.now().toIso8601String()),
      id: '1',
      text: 'NBA 2K22',
      imgUrl:
          'https://store-images.s-microsoft.com/image/apps.49092.13528939670494828.9f1c9646-ec16-415c-89c6-43719916ff4f.ea334207-ccad-4b4c-bdfe-cb43ecca58b8?mode=scale&q=90&h=1080&w=1920',
    ),
  ],
);
final navigationProvider = StateNotifierProvider<SelectedTab, int>((ref) {
  return SelectedTab();
});

class SelectedTab extends StateNotifier<int> {
  SelectedTab() : super(0);

  void selectPage(int index) {
    state = index;
  }
}

final cartProvider = StateNotifierProvider<ItemsCount, int>((ref) {
  return ItemsCount();
});

class ItemsCount extends StateNotifier<int> {
  ItemsCount() : super(6);
}

final appProvider = StateNotifierProvider<SelectedTheme, int>((ref) {
  return SelectedTheme();
});

class SelectedTheme extends StateNotifier<int> {
  SelectedTheme() : super(0);

  void selectTheme(bool index) {
    if (index == true) {
      state = 1;
    } else {
      state = 0;
    }
  }
}
