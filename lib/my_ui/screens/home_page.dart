import 'package:Bloem/my_ui/models/flowers.dart';
import 'package:Bloem/my_ui/screens/detail_page.dart';
import 'package:Bloem/my_ui/screens/widgets/flower_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Flower> _flowerList = Flower.flowerList;

    //Plants category
    List<String> _flowerShops = [
      'Orchidee Shop',
      'Atlantas',
      'King flower',
      'Plant Shop',
    ];

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(218, 207, 113, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50.0,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _flowerShops.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _flowerShops[index],
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 20.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Color.fromRGBO(218, 207, 113, 1)
                              : Color.fromRGBO(218, 207, 113, 1),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: size.height * .3,
            child: ListView.builder(
                itemCount: _flowerShops.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                flowerId: _flowerList[index].flowerId,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorated(
                                        _flowerList[index].isFavorated);
                                    _flowerList[index].isFavorated =
                                        isFavorited;
                                  });
                                },
                                icon: Icon(
                                  _flowerList[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Color.fromRGBO(33, 50, 68, 1),
                                ),
                                iconSize: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(218, 207, 113, 1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(_flowerList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _flowerList[index].shop,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(33, 50, 68, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'NunitoSans',
                                  ),
                                ),
                                Text(
                                  _flowerList[index].flowerName,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(33, 50, 68, 1),
                                    fontSize: 16,
                                    fontFamily: 'NunitoSans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(218, 207, 113, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                r'EGP' + _flowerList[index].price.toString(),
                                style: TextStyle(
                                    color: Color.fromRGBO(33, 50, 68, 1),
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(218, 207, 113, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: const Text(
              'N e w P l a n t s',
              style: TextStyle(
                color: Color.fromRGBO(218, 207, 113, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: 'NunitoSans',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: ListView.builder(
                itemCount: _flowerList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                    flowerId: _flowerList[index].flowerId),
                                type: PageTransitionType.bottomToTop));
                      },
                      child:
                          FlowerWidget(index: index, flowerList: _flowerList));
                }),
          ),
        ],
      ),
    ));
  }
}
