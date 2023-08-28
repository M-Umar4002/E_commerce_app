import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  List<CategoryElement>? categories;

  Category({
    this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categories: List<CategoryElement>.from(
            json["categories"].map((x) => CategoryElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class CategoryElement {
  String? id;
  String? name;
  String? image;
  DateTime? dateModified;
  DateTime? dateCreated;

  CategoryElement({
    this.id,
    this.name,
    this.image,
    this.dateModified,
    this.dateCreated,
  });

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dateModified: DateTime.parse(json["date_modified"]),
        dateCreated: DateTime.parse(json["date_created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "date_modified": dateModified!.toIso8601String(),
        "date_created": dateCreated!.toIso8601String(),
      };
}
