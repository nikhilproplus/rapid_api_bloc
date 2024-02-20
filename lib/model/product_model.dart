// To parse this JSON data, do
//
//     final searchedProduct = searchedProductFromJson(jsonString);

import 'dart:convert';

SearchedProduct searchedProductFromJson(String str) =>
    SearchedProduct.fromJson(json.decode(str));

String searchedProductToJson(SearchedProduct data) =>
    json.encode(data.toJson());

class SearchedProduct {
  String status;
  String requestId;
  List<Datum> data;

  SearchedProduct({
    required this.status,
    required this.requestId,
    required this.data,
  });

  factory SearchedProduct.fromJson(Map<String, dynamic> json) =>
      SearchedProduct(
        status: json["status"],
        requestId: json["request_id"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request_id": requestId,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String productId;
  String productTitle;
  String productDescription;
  List<String> productPhotos;

  double? productRating;

  Datum({
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPhotos,
    required this.productRating,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        productTitle: json["product_title"],
        productDescription: json["product_description"],
        productPhotos: List<String>.from(json["product_photos"].map((x) => x)),
        productRating: json["product_rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_title": productTitle,
        "product_description": productDescription,
        "product_photos": List<dynamic>.from(productPhotos.map((x) => x)),
        "product_rating": productRating,
      };
}
