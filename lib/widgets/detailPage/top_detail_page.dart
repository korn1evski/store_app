import 'package:flutter/material.dart';

import '../favorite_circle.dart';

class TopDetailPage extends StatelessWidget {
  final String productImg;
  const TopDetailPage({Key? key, required this.productImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 477,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 477,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(productImg),
              fit: BoxFit.cover,
            )),
          ),
          Positioned(
            top: 74,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FavoriteCircle(
                        size: 40,
                        iconSize: 25,
                        icon: Icons.arrow_back_ios_new,
                        backColor: Colors.transparent,
                      )),
                  FavoriteCircle(
                    size: 40,
                    iconSize: 25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
