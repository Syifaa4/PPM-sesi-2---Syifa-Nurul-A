import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils.dart';

/// Gambar produk. Kalau imagePath kosong / file tidak ditemukan,
/// tampil placeholder ikon.
class ProductImage extends StatelessWidget {
  final Product product;
  final double iconSize;

  const ProductImage({super.key, required this.product, this.iconSize = 50});

  Widget _placeholder() {
    return Container(
      color: product.color,
      child: Center(
        child: Icon(product.icon, size: iconSize, color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (product.imagePath == null) return _placeholder();
    return Image.asset(
      product.imagePath!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) => _placeholder(),
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductTile({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(child: ProductImage(product: product)),
                  if (product.isFavorite)
                    const Positioned(
                      top: 6,
                      right: 6,
                      child: Icon(Icons.favorite, color: Colors.red, size: 20),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13)),
                  Text(product.category,
                      style: const TextStyle(color: Colors.grey, fontSize: 11)),
                  const SizedBox(height: 2),
                  Text(formatRupiah(product.price),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}