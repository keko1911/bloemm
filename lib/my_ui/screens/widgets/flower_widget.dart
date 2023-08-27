import 'package:Bloem/my_ui/models/flowers.dart';
import 'package:Bloem/my_ui/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FlowerWidget extends StatelessWidget {
  const FlowerWidget({
    Key? key,
    required this.index,
    required this.flowerList,
  }) : super(key: key);

  final int index;
  final List<Flower> flowerList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  flowerId: flowerList[index].flowerId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(218, 207, 113, .8),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(33, 50, 68, .8),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset(flowerList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flowerList[index].shop,
                        style: TextStyle(
                          color: Color.fromRGBO(33, 50, 68, 1),
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        flowerList[index].flowerName,
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromRGBO(33, 50, 68, .8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                r'EGP' + flowerList[index].price.toString(),
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Color.fromRGBO(33, 50, 68, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
