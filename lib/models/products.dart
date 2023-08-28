class Products {
  List<Product>? products;

  Products({this.products});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? id;
  ProductsCategory? category;
  ProductsCategory? tag;
  String? name;
  String? price;
  String? description;
  String? image;
  String? rating;
  int? reviews;
  String? dateModified;
  String? dateCreated;
  bool isFavourited = false;

  Product(
      {this.id,
      this.category,
      this.tag,
      this.name,
      this.price,
      this.description,
      this.image,
      this.rating,
      this.reviews,
      this.dateModified,
      this.dateCreated});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? ProductsCategory.fromJson(json['category'])
        : null;
    tag = json['tag'] != null ? ProductsCategory.fromJson(json['tag']) : null;
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    reviews = json['reviews'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (tag != null) {
      data['tag'] = tag!.toJson();
    }
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    data['rating'] = rating;
    data['reviews'] = reviews;
    data['date_modified'] = dateModified;
    data['date_created'] = dateCreated;
    return data;
  }
}

class ProductsCategory {
  String? id;
  String? name;
  String? image;
  String? dateModified;
  String? dateCreated;

  ProductsCategory(
      {this.id, this.name, this.image, this.dateModified, this.dateCreated});

  ProductsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['date_modified'] = dateModified;
    data['date_created'] = dateCreated;
    return data;
  }
}
