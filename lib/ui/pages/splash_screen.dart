import 'package:ecommerce/custom_theme.dart';
import 'package:ecommerce/ui/pages/home_page.dart';
import 'package:ecommerce/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPurple,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Let's play Games that you like",
              textAlign: TextAlign.center,
              style: GoogleFonts.amiko(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            SvgPicture.asset(
              'assets/images/game.svg',
              height: 250,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              color: kYellow,
              text: 'NEXT',
              onTap: () {
                Navigator.of(context).pushNamed(MyHomePage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
