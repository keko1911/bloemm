import 'package:Bloem/my_ui/models/flowers.dart';
import 'package:Bloem/my_ui/screens/widgets/flower_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Flower> addedToCartFlowers;
  int calculateSum() {
    List<Flower> _selectedFlower = Flower.flowerList;
    _selectedFlower =
        _selectedFlower.where((element) => element.isSelected == true).toList();
    int sum = 0;
    for (var x in _selectedFlower) {
      sum += x.price;
    }
    return sum;
  }

  const CartPage({
    Key? key,
    required this.addedToCartFlowers,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: widget.addedToCartFlowers.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Cart is Empty',
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
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.addedToCartFlowers.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return FlowerWidget(
                              index: index,
                              flowerList: widget.addedToCartFlowers);
                        }),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'T o t a l',
                            style: TextStyle(
                              color: Color.fromRGBO(218, 207, 113, 1),
                              fontFamily: 'NunitoSans',
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            r'EGP' + calculateSum().toString(),
                            style: TextStyle(
                              fontFamily: 'NunitoSans',
                              fontSize: 24.0,
                              color: Color.fromRGBO(218, 207, 113, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  calculateSum() {
    List<Flower> _selectedFlower = Flower.flowerList;
    _selectedFlower =
        _selectedFlower.where((element) => element.isSelected == true).toList();
    int sum = 0;
    for (var x in _selectedFlower) {
      sum += x.price;
    }
    return sum;
  }
}
