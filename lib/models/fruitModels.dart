import 'package:flutter/material.dart';

class Fruitmodels {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Fruitmodels({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Convert model ke Map (untuk API / JSON / database)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "imageUrl": imageUrl,
    };
  }

  // Convert dari JSON ke model
  factory Fruitmodels.fromJson(Map<String, dynamic> json) {
    return Fruitmodels(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: (json["price"] is int)
          ? (json["price"] as int).toDouble()
          : json["price"].toDouble(),
      imageUrl: json["imageUrl"],
    );
  }

  // Untuk update sebagian data (tidak merusak object asli)
  Fruitmodels copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
  }) {
    return Fruitmodels(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
