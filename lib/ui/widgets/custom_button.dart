import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;
  const CustomButton({
    required this.onTap,
    required this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          height: 40,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.robotoCondensed(
                  fontWeight: FontWeight.w600, fontSize: 24, color: kBlack),
            ),
          ),
        ),
      ),
    );
  }
}
