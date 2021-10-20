import 'package:ecommerce/providers/main_provider.dart';
import 'package:ecommerce/ui/pages/downloads_page.dart';
import 'package:ecommerce/ui/pages/favorites_screen.dart';
import 'package:ecommerce/ui/pages/home_page.dart';
import 'package:ecommerce/ui/pages/item_detail_page.dart';
import 'package:ecommerce/ui/pages/news_detail_screen.dart';
import 'package:ecommerce/ui/pages/news_screen.dart';
import 'package:ecommerce/ui/pages/others_screen.dart';
import 'package:ecommerce/ui/pages/sign_in.dart';
import 'package:ecommerce/ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  final HttpLink httpLink = HttpLink('https://demo.saleor.io/graphql/');

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    ),
  );

  var app = GraphQLProvider(
    client: client,
    child: const MyApp(),
  );

  runApp(ProviderScope(child: app));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appProvider = ref.watch(appProvider);

    //TODO sistemare
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarBrightness: Brightness.light, //status bar brigtness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
      systemNavigationBarDividerColor:
          Colors.white, //Navigation bar divider color
      systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
    ));
    return MaterialApp(
      initialRoute: MyHomePage.routeName,
      routes: {
        ItemDetailPage.routeName: (context) => const ItemDetailPage(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        MyHomePage.routeName: (context) => const MyHomePage(),
        NewsScreen.routeName: (context) => const NewsScreen(),
        NewsDetailPage.routeName: (context) => const NewsDetailPage(),
        OthersScreen.routeName: (context) => const OthersScreen(),
        FavoritesScreen.routeName: (context) => FavoritesScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        DownloadsPage.routeName: (context) => const DownloadsPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: _appProvider == 0
          ? ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                titleTextStyle: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            )
          : ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.black87,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[500],
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
              ),
            ),
      home: const MyHomePage(),
    );
  }
}
