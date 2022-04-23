
import 'package:flutter/material.dart';
import 'package:store_app/models/category_model.dart';

import '../category.dart';

class CategoriesMainPage extends StatelessWidget {
  final int length;
  final List<MainCategory> categories;
  const CategoriesMainPage({Key? key, required this.length,  required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      width: double.maxFinite,
      height: 105,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CategoryWidget(
                text: categories[index].name,
                iconImg: categories[index].icon,
              ),
            );
          }),
    );
  }
}
