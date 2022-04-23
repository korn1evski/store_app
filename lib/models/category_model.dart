import 'dart:convert';

CategoriesInfo CategoriesInfoFromJson(String str) => CategoriesInfo.fromJson(json.decode(str));

String CategoriesInfoToJson(CategoriesInfo data) => json.encode(data.toJson());

class CategoriesInfo {
  CategoriesInfo({
    required this.count,
    required this.totalPages,
    required this.perPage,
    required this.currentPage,
    required this.categories,
  });

  int count;
  int totalPages;
  int perPage;
  int currentPage;
  List<MainCategory> categories;

  factory CategoriesInfo.fromJson(Map<String, dynamic> json) => CategoriesInfo(
    count: json["count"],
    totalPages: json["total_pages"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    categories: List<MainCategory>.from(json["results"].map((x) => MainCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "total_pages": totalPages,
    "per_page": perPage,
    "current_page": currentPage,
    "results": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class MainCategory {
  MainCategory ({
    required this.name,
    required this.icon,
  });

  String name;
  String icon;

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
    name: json["name"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "icon": icon,
  };
}
