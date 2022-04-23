
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:store_app/services/data_services.dart';

import '../../cubit/app_cubits.dart';
import '../../models/products_model.dart';
import '../../pages/detail_page.dart';
import '../product.dart';

class CarouselMainPage extends StatelessWidget {
  final RefreshController refreshController;
  final List<Result> products;
  final DataServices data;
  final int currentPage;
  final int totalPages;
  const CarouselMainPage({Key? key, required this.refreshController, required this.products, required this.currentPage, required this.totalPages, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: double.maxFinite,
      child: SmartRefresher(
        enablePullUp: true,
        controller: refreshController,
        onRefresh: () async {
          if (products.isNotEmpty) {
            products.length = 10;
            refreshController.refreshCompleted();
            refreshController.resetNoData();
            BlocProvider.of<AppCubits>(context)
                .refreshedMain(products, 1);
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          if (currentPage >= totalPages) {
            refreshController.loadNoData();
            return;
          } else {
            var productsResponse =
            await data.getResultData(currentPage+1);
            if (productsResponse.isNotEmpty) {
              products.addAll(productsResponse);
              refreshController.loadComplete();
              BlocProvider.of<AppCubits>(context)
                  .refreshedMain(products, currentPage+1);
            } else {
              refreshController.loadFailed();
            }
          }
        },
        child: GridView.builder(
            itemCount: products.length,
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 6,
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(product: products[index]))
                  );
                },
                child: Product(
                  imgPath: Result.properImage(products[index].category.name),
                  name: products[index].name,
                  brand: products[index].details,
                  price: products[index].price.toInt().toString(),
                ),
              );
            }),
      ),
    );
  }
}
