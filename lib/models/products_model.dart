// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.count,
    required this.totalPages,
    required this.perPage,
    required this.currentPage,
    required this.results,
  });

  int count;
  int totalPages;
  int perPage;
  int currentPage;
  List<Result> results;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    count: json["count"],
    totalPages: json["total_pages"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "total_pages": totalPages,
    "per_page": perPage,
    "current_page": currentPage,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  static String properImage(String category){
    if (category.startsWith('Electronics')){
      return 'img/iphone.jpeg';
    } else if (category.startsWith('Men\'s Clothing')){
      return 'img/man.jpeg';
    } else if (category.startsWith('Hobby,')){
      return 'img/travel.jpeg';
    } else if (category.startsWith('Health')){
      return 'img/beauty.jpeg';
    } else if (category.startsWith('Home')){
      return 'img/home.jpeg';
    }  else if (category.startsWith('Women\'s')){
      return 'img/woman.jpeg';
    } else {
      return 'img/watch.jpeg';
    }
  }

  Result({
    required this.category,
    required this.name,
    required this.details,
    required this.size,
    required this.colour,
    required this.price,
    required this.soldCount,
    required this.id,
  });

  Category category;
  String name;
  String details;
  String size;
  String colour;
  double price;
  int soldCount;
  int id;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: Category.fromJson(json["category"]),
    name: json["name"],
    details: json["details"],
    size: json["size"],
    colour: json["colour"],
    price: json["price"],
    soldCount: json["sold_count"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "category": category.toJson(),
    "name": name,
    "details": details,
    "size": size,
    "colour": colour,
    "price": price,
    "sold_count": soldCount,
    "id": id,
  };
}

class Category {
  Category({
    required this.name,
    required this.icon,
    required this.id,
  });

  String name;
  String icon;
  int id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    icon: json["icon"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "icon": icon,
    "id": id,
  };
}
