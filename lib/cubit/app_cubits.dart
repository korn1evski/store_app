import 'package:bloc/bloc.dart';
import 'package:store_app/cubit/app_cubit_states.dart';
import 'package:store_app/services/data_services.dart';

import '../models/products_model.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState());

  final DataServices data;
  late final products;
  late final categories;
  int currentPage = 1;

  void loading(){
    emit(MainLoadingState());
  }

  Future<void> getInfoMain() async{
    try{
      products = await data.getResultData(currentPage);
      categories = await data.getCategoriesData();
      emit(MainLoadedState(products: products, currentPage: currentPage, totalPages: data.totalPages, categories: categories));
    } catch(e) {

    }
  }

  void refreshedMain(List<Result> products, currentPage){
    this.currentPage = currentPage;
    emit(MainLoadedState(products: products, currentPage: this.currentPage, totalPages: data.totalPages, categories: categories));
  }

  // void detailPage(Result product) {
  //   emit(DetailState(product: product));
  // }

  void goMain(){
    emit(MainLoadedState(products: products, currentPage: currentPage, totalPages: data.totalPages, categories: categories));
  }

}