import 'package:ecommerce/custom_theme.dart';
import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/providers/main_provider.dart';
import 'package:ecommerce/ui/pages/news_screen.dart';
import 'package:ecommerce/ui/pages/shop_screen.dart';
import 'package:ecommerce/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce/ui/widgets/custom_item_square_grid.dart';
import 'package:ecommerce/ui/widgets/custom_text_field.dart';
import 'package:ecommerce/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'others_screen.dart';

class MyHomePage extends ConsumerWidget {
  static const routeName = '/home-page';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FocusNode _focusNode = FocusNode();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.96),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: const CustomAppBar(
        title: 'FlutterGAMING',
        goBack: false,
      ),
      body: getSelectedPage(
        ref.watch(navigationProvider),
      ),
    );
  }

  Widget getSelectedPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePageTab();
      case 1:
        return const NewsScreen();
      case 2:
        return const ShopScreen();
      case 3:
        return const OthersScreen();
      default:
        return const HomePageTab();
    }
  }
}

class HomePageTab extends ConsumerWidget {
  const HomePageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final games = ref.watch(gamesProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*       Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bentornato Leonardo',
                  style: GoogleFonts.amiko(
                    color: kBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://www.adnkronos.com/resources/026d-134d679fe1dc-fb2471c8de2d-1000/format/big/leonardodicaprio.jpg'),
                ),
              ],
            ),*/
            const SizedBox(
              height: 16,
            ),
            Text(
              'Popular',
              style: GoogleFonts.robotoCondensed(
                letterSpacing: 0.85,
                color: kBlack,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return CustomItemSquareGrid(
                    model: ItemVM(
                        title: games[index].name,
                        id: games[index].id!,
                        imgUrl: games[index].imgUrl,
                        rating: games[index].rating.toString()),
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
