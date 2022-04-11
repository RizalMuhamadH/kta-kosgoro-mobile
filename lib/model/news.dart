class News {
  int? code;
  List<Data>? data;
  String? message;

  News({this.code, this.data, this.message});

  News.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? slug;
  String? title;
  String? description;
  String? body;
  String? source;
  String? sourceLink;
  bool? featured;
  int? categoryId;
  int? userId;
  String? status;
  String? metaDescription;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? thumbnail;
  Category? category;
  Author? author;

  Data(
      {this.id,
      this.slug,
      this.title,
      this.description,
      this.body,
      this.source,
      this.sourceLink,
      this.featured,
      this.categoryId,
      this.userId,
      this.status,
      this.metaDescription,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.thumbnail,
      this.category,
      this.author});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
    body = json['body'];
    source = json['source'];
    sourceLink = json['source_link'];
    featured = json['featured'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    status = json['status'];
    metaDescription = json['meta_description'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    thumbnail = json['thumbnail'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['description'] = this.description;
    data['body'] = this.body;
    data['source'] = this.source;
    data['source_link'] = this.sourceLink;
    data['featured'] = this.featured;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['meta_description'] = this.metaDescription;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['thumbnail'] = this.thumbnail;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? slug;
  String? name;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.slug, this.name, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Author {
  int? id;
  String? name;

  Author({this.id, this.name});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
