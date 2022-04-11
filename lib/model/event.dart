class Event {
  int? code;
  List<Data>? data;
  String? message;

  Event({this.code, this.data, this.message});

  Event.fromJson(Map<String, dynamic> json) {
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
  bool? featured;
  int? categoryId;
  String? metaDescription;
  String? startDate;
  String? endDate;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? thumbnail;
  Category? category;

  Data(
      {this.id,
      this.slug,
      this.title,
      this.description,
      this.body,
      this.featured,
      this.categoryId,
      this.metaDescription,
      this.startDate,
      this.endDate,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.thumbnail,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
    body = json['body'];
    featured = json['featured'];
    categoryId = json['category_id'];
    metaDescription = json['meta_description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    thumbnail = json['thumbnail'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['description'] = this.description;
    data['body'] = this.body;
    data['featured'] = this.featured;
    data['category_id'] = this.categoryId;
    data['meta_description'] = this.metaDescription;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['thumbnail'] = this.thumbnail;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
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
