import 'package:Bloem/my_ui/models/flowers.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int flowerId;
  const DetailPage({Key? key, required this.flowerId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Flower> _flowerList = Flower.flowerList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(218, 207, 113, .15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Color.fromRGBO(218, 207, 113, 1),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(218, 207, 113, .15),
                    ),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            bool isFavorited = toggleIsFavorated(
                                _flowerList[widget.flowerId].isFavorated);
                            _flowerList[widget.flowerId].isFavorated =
                                isFavorited;
                          });
                        },
                        icon: Icon(
                          _flowerList[widget.flowerId].isFavorated == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Color.fromRGBO(218, 207, 113, 1),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_flowerList[widget.flowerId].imageURL),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlowerFeature(
                            title: 'Duration',
                            flowerFeature:
                                _flowerList[widget.flowerId].duration,
                          ),
                          FlowerFeature(
                            title: 'Watering',
                            flowerFeature:
                                _flowerList[widget.flowerId].watering,
                          ),
                          FlowerFeature(
                            title: 'Temperature',
                            flowerFeature:
                                _flowerList[widget.flowerId].temperature,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(218, 207, 113, .4),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _flowerList[widget.flowerId].flowerName,
                            style: TextStyle(
                              color: Color.fromRGBO(218, 207, 113, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'EGP' +
                                _flowerList[widget.flowerId].price.toString(),
                            style: TextStyle(
                              color: Color.fromRGBO(218, 207, 113, 1),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _flowerList[widget.flowerId].rating.toString(),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Color.fromRGBO(218, 207, 113, 1),
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Color.fromRGBO(218, 207, 113, 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      _flowerList[widget.flowerId].decription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18,
                        color: Color.fromRGBO(231, 225, 210, .7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      bool isSelected = toggleIsSelected(
                          _flowerList[widget.flowerId].isSelected);

                      _flowerList[widget.flowerId].isSelected = isSelected;
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: _flowerList[widget.flowerId].isSelected == true
                        ? Color.fromRGBO(33, 50, 68, 1)
                        : Color.fromRGBO(218, 207, 113, 1),
                  )),
              decoration: BoxDecoration(
                  color: _flowerList[widget.flowerId].isSelected == true
                      ? Color.fromRGBO(218, 207, 113, .5)
                      : Color.fromRGBO(218, 207, 113, .5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Color.fromRGBO(231, 225, 210, 1),
                    ),
                  ]),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(218, 207, 113, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Color.fromRGBO(218, 207, 113, 1),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'B U Y N O W',
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(33, 50, 68, 1),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlowerFeature extends StatelessWidget {
  final String flowerFeature;
  final String title;
  const FlowerFeature({
    Key? key,
    required this.flowerFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(231, 225, 210, 1),
          ),
        ),
        Text(
          flowerFeature,
          style: TextStyle(
            color: Color.fromRGBO(218, 207, 113, 1),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
