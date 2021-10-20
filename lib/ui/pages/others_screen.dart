import 'package:ecommerce/providers/main_provider.dart';
import 'package:ecommerce/ui/pages/downloads_page.dart';
import 'package:ecommerce/ui/pages/favorites_screen.dart';
import 'package:ecommerce/ui/pages/item_detail_page.dart';
import 'package:ecommerce/ui/widgets/custom_list_tile_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class OthersScreen extends ConsumerStatefulWidget {
  const OthersScreen({Key? key}) : super(key: key);
  static const routeName = '/others-screen';

  @override
  _OthersScreenState createState() => _OthersScreenState();
}

class _OthersScreenState extends ConsumerState<OthersScreen> {
  List<String> languages = ['English', 'Italian', 'French'];
  var selectedValue = 1;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://www.adnkronos.com/resources/026d-134d679fe1dc-fb2471c8de2d-1000/format/big/leonardodicaprio.jpg',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Leonardo DiCaprio',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.77,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'leonardo.dicaprio@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'CONTENT',
                style: GoogleFonts.cabin(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.55),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomListTileSetting(
            onTap: () =>
                Navigator.of(context).pushNamed(FavoritesScreen.routeName),
            title: 'Favorites',
            icon: Icon(Icons.favorite_border_rounded),
          ),
          CustomListTileSetting(
            onTap: () =>
                Navigator.of(context).pushNamed(DownloadsPage.routeName),
            title: 'Downloads',
            icon: const Icon(Icons.cloud_download),
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'PREFERENCES',
                style: GoogleFonts.cabin(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.55),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoPicker(
                      backgroundColor: Colors.white,
                      onSelectedItemChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      itemExtent: 32.0,
                      children: const [
                        Text('English'),
                        Text('Italian'),
                        Text('French'),
                      ],
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(Icons.language),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Language'),
                  const Spacer(),
                  Text(
                    languages[selectedValue],
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                const Icon(Icons.dark_mode),
                const SizedBox(
                  width: 8,
                ),
                const Text('Dark Mode'),
                const Spacer(),
                Switch(
                  value: isDark,
                  onChanged: (value) {
                    setState(() {
                      isDark = value;
                      ref.read(appProvider.notifier).selectTheme(value);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
