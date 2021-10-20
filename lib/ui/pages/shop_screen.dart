import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const productsGraphQL = """
    query products {
  products(first: 25, channel: "default-channel") {
    edges {
      node {
        id
        name
        description
        thumbnail
        {
        url
        }
      }
    }
  }
}""";

    return Query(
        options: QueryOptions(
          document: gql(productsGraphQL),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text('error');
          }
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final productsList = result.data?['products']['edges'];
          return GridView.builder(
            padding: const EdgeInsets.only(top: 24),
            itemCount: productsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.network(
                    productsList[index]['node']['thumbnail']['url'],
                  ),
                  Text(
                    productsList[index]['node']['name'],
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ],
              );
            },
          );
        }
/*      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 128,
            ),
            Center(
              child: Text(
                'Shop screen',
                style: GoogleFonts.amiko(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),*/
        );
  }
}
