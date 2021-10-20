import 'package:ecommerce/models/article.dart';
import 'package:ecommerce/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_theme.dart';

class NewsDetailPage extends StatefulWidget {
  static const routeName = '/news-detail-page';

  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isFavorite = false;
  Article? article;

  void setFavorite() => setState(() {
        isFavorite = !isFavorite;
      });

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        article = ModalRoute.of(context)?.settings.arguments as Article;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        goBack: true,
        trailing: IconButton(
          icon: Icon(Icons.share, color: Theme.of(context).primaryColor),
          onPressed: () {},
        ),
      ),
      body: article != null
          ? SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        article!.imgUrl,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article!.title,
                            style: GoogleFonts.aBeeZee(
                              color: kBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          GestureDetector(
                            onTap: setFavorite,
                            child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border_rounded,
                                color: isFavorite == true
                                    ? Colors.red
                                    : Colors.black),
                          ),
                        ]),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur',
                      style: TextStyle(
                          textBaseline: TextBaseline.ideographic, height: 1.5),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
