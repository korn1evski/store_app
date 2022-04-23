import 'package:http/http.dart' as http;
import '../models/category_model.dart';
import '../models/products_model.dart';

class DataServices {
  final String baseUrl = 'http://mobile-shop-api.hiring.devebs.net';
  late int totalPages;

  Future<List<Result>> getResultData(int currentPage) async {
    final String apiURl = "/products?page=" + currentPage.toString() + "&page_size=10";
    http.Response response = await http.get(Uri.parse(baseUrl + apiURl));

   try{
     if (response.statusCode == 200){
       final result = productsFromJson(response.body);
       totalPages = result.totalPages;
       return result.results;
     } else {
       return <Result>[];
     }
   } catch(e){
     return <Result>[];
   }
  }

  Future<List<MainCategory>> getCategoriesData() async {
    final String apiURl = '/categories';
    http.Response response = await http.get(Uri.parse(baseUrl + apiURl));

    try{
      if (response.statusCode == 200){
        final result = CategoriesInfoFromJson(response.body);
        return result.categories;
      } else {
        return <MainCategory>[];
      }
    } catch(e){
      return <MainCategory>[];
    }
  }
}