import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/providers/main_provider.dart';
import 'package:ecommerce/ui/widgets/custom_app_bar.dart';
import 'package:ecommerce/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_theme.dart';

class ItemDetailPage extends ConsumerStatefulWidget {
  static const routeName = '/item-detail-page';

  const ItemDetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends ConsumerState<ItemDetailPage> {
  bool isFavorite = false;
  ItemVM? game;

  void setFavorite() => setState(() {
        isFavorite = !isFavorite;
      });

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        game ??= ModalRoute.of(context)!.settings.arguments as ItemVM;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          goBack: true,
          trailing: IconButton(
            icon: Icon(
              Icons.share,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          ),
        ),
        body: game != null
            ? SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(game!.imgUrl),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              game!.title,
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
                      Row(
                        children: const [
                          Chip(
                            label: Text('Games'),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Chip(label: Text('2021')),
                          SizedBox(
                            width: 4,
                          ),
                          Chip(label: Text('Adventure')),
                          SizedBox(
                            width: 4,
                          ),
                          Chip(label: Text('Popular')),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Crash Bandicoot 4: It's About Time è tutto quello che un fan storico della serie potrebbe desiderare, un atto d'amore che Toys for Bob ha confezionato con cura, donando al marsupiale arancione nuova linfa. Dal punto di vista visivo è eccezionale, con un look graffiante e uno stile moderno che non si dimentica però del passato. Se a qualcuno il look del protagonista poteva sembrare strano, lo troverà perfettamente calzante in questo nuovo capitolo, funzionale alla trama folle che il team ha imbastito. Tutto il gioco è pieno di riferimenti alla serie, che manderanno letteralmente in brodo di giuggiole gli aficionados. Le nuove meccaniche di gameplay e la varietà di situazioni possono ingolosire anche i nuovi arrivati, che potrebbero cercare un titolo che sappia metterli alla prova con percorsi che vanno spesso memorizzati al millimetro per poterli superare al 100%. I ragazzi di Toys for Bob non si sono risparmiati sul fronte difficoltà, mettendo in piedi sfide che a volte appaiono fin troppo frustranti. Sono elementi che escono fuori cercando di completare a dovere i livelli e che non inficiano l'esperienza generale, ma il cuore di un platform del genere sta soprattutto nel prodigarsi a scovare ogni collezionabile, e sotto questo fronte servirebbe un bilanciamento generale, visto che l'alto livello di difficoltà appare fin troppo artificioso. Anche senza puntare al completamento totale del gioco ci sono comunque tantissime cose da fare, che terranno impegnati anche i meno impallinati di platform e chi cerca un'avventura colorata e divertente.",
                        style: TextStyle(
                            textBaseline: TextBaseline.ideographic,
                            height: 1.5),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink());
  }
}
