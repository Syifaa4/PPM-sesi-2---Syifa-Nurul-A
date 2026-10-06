import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final int price;
  final int originalPrice;
  final String? imagePath; // isi nanti, mis. 'assets/images/donut.png'
  final IconData icon; // dipakai kalau imagePath belum diisi
  final Color color;

  // State yang bisa berubah
  bool isFavorite;
  int likes;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.originalPrice,
    required this.icon,
    required this.color,
    this.imagePath,
    this.isFavorite = false,
    this.likes = 0,
  });
}