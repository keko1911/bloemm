import 'package:Bloem/my_ui/models/flowers.dart';
import 'package:Bloem/my_ui/screens/widgets/flower_widget.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final List<Flower> favoritedFlowers;
  const FavoritePage({Key? key, required this.favoritedFlowers})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedFlowers.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your favorited Plants',
                    style: TextStyle(
                      color: Color.fromRGBO(218, 207, 113, 1),
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: widget.favoritedFlowers.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return FlowerWidget(
                        index: index, flowerList: widget.favoritedFlowers);
                  }),
            ),
    );
  }
}
