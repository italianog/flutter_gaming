import 'package:ecommerce/custom_theme.dart';
import 'package:ecommerce/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  static const routeName = '/favorite-screen';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final List<Map<String, dynamic>> list = [
    {'name': 'Resident Evil', 'favorite': true},
    {'name': 'Crash', 'favorite': true},
    {'name': 'Call of Duty', 'favorite': true},
    {'name': 'Fifa 21', 'favorite': true},
    {'name': 'Resident Evil', 'favorite': true},
    {'name': 'Crash', 'favorite': true},
    {'name': 'Call of Duty', 'favorite': true},
    {'name': 'Fifa 21', 'favorite': true},
    {'name': 'Resident Evil', 'favorite': true},
    {'name': 'Crash', 'favorite': true},
    {'name': 'Call of Duty', 'favorite': true},
    {'name': 'Fifa 21', 'favorite': true},
    {'name': 'Resident Evil', 'favorite': true},
    {'name': 'Crash', 'favorite': true},
    {'name': 'Call of Duty', 'favorite': true},
    {'name': 'Fifa 21', 'favorite': true},
    {'name': 'Resident Evil', 'favorite': true},
    {'name': 'Crash', 'favorite': true},
    {'name': 'Call of Duty', 'favorite': true},
    {'name': 'Fifa 21', 'favorite': true},
    {'name': 'Resident Evil', 'favorite': true},
    {'name': 'Crash', 'favorite': true},
    {'name': 'Call of Duty', 'favorite': true},
    {'name': 'Fifa 21', 'favorite': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        GestureDetector(
          onTap: () {
            //TODO logica con BE
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(
                "Salva",
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            width: double.infinity,
          ),
        ),
      ],
      appBar: const CustomAppBar(
        title: 'Favorites',
        goBack: true,
        titleStyle: TextStyle(color: kBlack),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  color: Colors.grey[700],
                );
              },
              itemBuilder: (context, index) {
                return (CheckboxListTile(
                  tileColor: list[index]['favorite']
                      ? Colors.orange[50]
                      : Colors.white,
                  title: Text(list[index]['name']),
                  onChanged: (value) {
                    setState(() {
                      list[index]['favorite'] = !list[index]['favorite'];
                    });
                  },
                  value: list[index]['favorite'],
                ));
              },
              itemCount: list.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
