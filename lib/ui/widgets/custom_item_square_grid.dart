import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/ui/pages/item_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomItemSquareGrid extends StatelessWidget {
  final ItemVM model;
  const CustomItemSquareGrid({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ItemDetailPage.routeName, arguments: model),
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.65),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(model.imgUrl, fit: BoxFit.fitHeight,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                  return const Text('Some error has occurred');
                }, loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
              child: Text(
                model.title,
                style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.05),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  model.rating,
                  style: GoogleFonts.aldrich(
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
