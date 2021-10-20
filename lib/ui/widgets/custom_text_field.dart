import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required FocusNode focusNode,
    required TextEditingController searchController,
  })  : _focusNode = focusNode,
        _searchController = searchController,
        super(key: key);

  final FocusNode _focusNode;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _searchController,
        onTap: _focusNode.requestFocus,
        style: GoogleFonts.lato(color: Colors.black87),
        cursorColor: Colors.grey,
        focusNode: _focusNode,
        decoration: InputDecoration(
          focusColor: Colors.white,
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _searchController.text = '';
            },
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          hintText: 'Search...',
          hintStyle: const TextStyle(color: Colors.grey),
          hintMaxLines: 1,
        ),
      ),
    );
  }
}
