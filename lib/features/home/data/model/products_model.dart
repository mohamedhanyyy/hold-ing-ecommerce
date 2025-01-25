class ProductsModel {
  int? id;
  String? title;
  int? price;
  int quant = 1;
  String? description;
  List? images = [];
  String? creationAt;
  String? updatedAt;
  Category? category;

  ProductsModel({
    this.id,
    this.title,
    this.quant = 0,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'] != null ? List<String>.from(json['images']) : null;
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    if (json['category'] is Map<String, dynamic>) {
      category = Category.fromJson(json['category']);
    } else {
      category = null; // Handle cases where category is malformed or not a map
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }

  ProductsModel copyWith({
    int? id,
    String? title,
    int? price,
    int? quant,
    String? description,
    List? images,
    String? creationAt,
    String? updatedAt,
    Category? category,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quant: quant ?? this.quant,
      description: description ?? this.description,
      images: images ?? this.images,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
    );
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
