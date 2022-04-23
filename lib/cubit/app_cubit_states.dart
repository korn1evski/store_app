import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/products_model.dart';

abstract class CubitStates extends Equatable {

}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class MainLoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class MainLoadedState extends CubitStates {
  MainLoadedState({required this.products, required this.currentPage, required this.totalPages, required this.categories});
  final List<Result> products;
  final List<MainCategory> categories;
  final int currentPage;
  final int totalPages;
  @override
  // TODO: implement props
  List<Object?> get props => [products, currentPage, categories];

}

// class DetailState extends CubitStates {
//   DetailState({required this.product});
//
//   final Result product;
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [product];
//
// }