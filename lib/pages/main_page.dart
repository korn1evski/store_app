import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:store_app/cubit/app_cubit_states.dart';
import 'package:store_app/services/data_services.dart';
import 'package:store_app/widgets/common_text.dart';
import 'package:store_app/widgets/mainPage/carousel_main_page.dart';
import 'package:store_app/widgets/mainPage/categories_main_page.dart';
import 'package:store_app/widgets/mainPage/top_main_page.dart';
import '../cubit/app_cubits.dart';
import '../models/products_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin,  AutomaticKeepAliveClientMixin{
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  DataServices data = DataServices();
  List<Result> products = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is MainLoadedState) {
        var totalPages = state.totalPages;
        if (state.currentPage == 1) {
          products = state.products;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopMainPage(),
            const SizedBox(
              height: 44,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: CommonText(
                text: 'Categories',
                size: 18,
                font: 'SFPRODISPLAYBOLD',
              ),
            ),
            SizedBox(
              height: 19,
            ),
            CategoriesMainPage(length: state.categories.length, categories: state.categories,),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                      text: 'Best Selling', size: 18, font: 'SFPRODISPLAYBOLD'),
                  CommonText(text: 'See all', size: 16)
                ],
              ),
            ),
            SizedBox(
              height: 31,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: CarouselMainPage(refreshController: refreshController, products: products, currentPage: state.currentPage, totalPages: totalPages, data: data),
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    }));
  }
  @override
  bool get wantKeepAlive => true;
}
