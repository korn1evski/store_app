import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/app_cubits.dart';
import 'package:store_app/widgets/add_button.dart';
import 'package:store_app/widgets/common_text.dart';
import 'package:store_app/widgets/detailPage/bottom_detail_page.dart';
import 'package:store_app/widgets/detailPage/content_detail_page.dart';
import 'package:store_app/widgets/favorite_circle.dart';
import 'package:store_app/widgets/oval_info.dart';
import 'package:store_app/widgets/detailPage/top_detail_page.dart';

import '../core/colors.dart';
import '../models/products_model.dart';

class DetailPage extends StatelessWidget {
  final Result product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  TopDetailPage(productImg: Result.properImage(product.category.name),),
                  ContentDetailPage(productName: product.name, productSize: product.size, productColor: product.colour, productDetails: product.details)
                ],
              ),
            ),
          ),
          BottomDetailPage(productPrice: product.price,)
        ],
      ),
    );
  }
}
