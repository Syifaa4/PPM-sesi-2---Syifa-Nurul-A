import 'package:flutter/material.dart';
import '../constants.dart' hide formatRupiah;
import '../models/product.dart';
import '../utils.dart';
import '../widgets/product_card.dart';
import '../widgets/product_tile.dart';
import '../widgets/profile_card.dart';
import '../widgets/promo_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Isi imagePath dengan gambarmu, mis. 'assets/images/croissant.png'
  final List<Product> _products = [
    Product(
      name: 'Croissant',
      category: 'Bakery',
      price: 10000,
      originalPrice: 15000,
      likes: 12,
      icon: Icons.bakery_dining,
      color: const Color(0xFFFFE0B2),
        imagePath: 'assets/images/croissant.jpg',
    ),
    Product(
      name: 'Roti',
      category: 'Bakery',
      price: 6000,
      originalPrice: 15000,
      likes: 12,
      icon: Icons.bakery_dining,
      color: const Color(0xFFFFE0B2),
        imagePath: 'assets/images/roti.jpg',
    ),
    Product(
      name: 'Nasi Ayam',
      category: 'Meal',
      price: 12000,
      originalPrice: 20000,
      likes: 8,
      icon: Icons.rice_bowl,
      color: const Color(0xFFC8E6C9),
        imagePath: 'assets/images/nasi_ayam.jpg',
    ),
    Product(
      name: 'Fried Chicken Combo',
      category: 'Fast Food',
      price: 18000,
      originalPrice: 30000,
      likes: 5,
      icon: Icons.cake,
      color: const Color(0xFFF8BBD0),
        imagePath: 'assets/images/chicken.jpg',
    ),
    Product(
      name: 'Donat Cokelat',
      category: 'Bakery',
      price: 5000,
      originalPrice: 11000,
      likes: 3,
      icon: Icons.donut_large,
      color: const Color(0xFFD7CCC8),
        imagePath: 'assets/images/donat.jpg',
    ),
    Product(
      name: 'Pisang',
      category: 'Fruit',
      price: 6000,
      originalPrice: 15000,
      likes: 8,
      icon: Icons.local_cafe,
      color: const Color(0xFFBCAAA4),
        imagePath: 'assets/images/banana.jpg',
    ),
    Product(
      name: 'Sawi',
      category: 'Vegetable',
      price: 3000,
      originalPrice: 6000,
      likes: 2,
      icon: Icons.lunch_dining,
      color: const Color(0xFFFFF9C4),
        imagePath: 'assets/images/sawi.jpg',
    ),
    Product(
      name: 'Pasta',
      category: 'Meal',
      price: 10000,
      originalPrice: 20000,
      likes: 2,
      icon: Icons.lunch_dining,
      color: const Color(0xFFFFF9C4),
        imagePath: 'assets/images/pasta.jpg',
    ),
    Product(
      name: 'Susu UHT',
      category: 'Beverage',
      price: 10000,
      originalPrice: 21000,
      likes: 2,
      icon: Icons.lunch_dining,
      color: const Color(0xFFFFF9C4),
        imagePath: 'assets/images/milk.jpg',
    ),
    Product(
      name: 'Apel',
      category: 'Fruit',
      price: 4000,
      originalPrice: 8000,
      likes: 2,
      icon: Icons.lunch_dining,
      color: const Color(0xFFFFF9C4),
        imagePath: 'assets/images/apel.jpg',
    ),
  ];

  // Keranjang: produk -> jumlah
  final Map<Product, int> _cart = {};

  int get _cartCount => _cart.values.fold(0, (a, b) => a + b);

  void _addToCart(Product product, int quantity) {
    setState(() {
      _cart[product] = (_cart[product] ?? 0) + quantity;
    });
  }

  Future<void> _openProduct(Product product) async {
    await showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: SingleChildScrollView(
            child: ProductCard(
              product: product,
              onAddToCart: (qty) {
                _addToCart(product, qty);
                Navigator.pop(dialogContext); // tutup detail
              },
            ),
          ),
        ),
      ),
    );
    // Refresh kotak produk (ikon hati bisa berubah)
    if (mounted) setState(() {});
  }

  void _openCart() {
    final total = _cart.entries
        .fold<int>(0, (sum, e) => sum + e.key.price * e.value);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keranjang'),
        content: SizedBox(
          width: 360,
          child: _cart.isEmpty
              ? const Text('Keranjang masih kosong.')
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final e in _cart.entries)
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(e.key.name),
                        subtitle: Text(
                            '${e.value} × ${formatRupiah(e.key.price)}'),
                        trailing:
                            Text(formatRupiah(e.key.price * e.value)),
                      ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(formatRupiah(total),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
        ),
        actions: [
          if (_cart.isNotEmpty)
            TextButton(
              onPressed: () {
                setState(() => _cart.clear());
                Navigator.pop(ctx);
              },
              child: const Text('Kosongkan'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('PPM Sesi 2 - $namaMahasiswa ($nimMahasiswa)'),
        backgroundColor: warna.primary,
        foregroundColor: warna.onPrimary,
        actions: [
          const Icon(Icons.eco, color: Color(0xFF81C784)), // logo daun
          IconButton(
            onPressed: _openCart,
            icon: Badge(
              label: Text('$_cartCount'),
              isLabelVisible: _cartCount > 0,
              child: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1500),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PromoBanner(),
                const SizedBox(height: 20),
                const SizedBox(
                  width: double.infinity,
                  child: ProfileCard(
                    name: namaMahasiswa,
                    nim: nimMahasiswa,
                    prodiKelas: 'Teknik Informatika - TI24 G',
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Produk FreshSave',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A2948),
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Ketuk produk untuk melihat detail',
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _products.length,
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 190,
                    childAspectRatio: 0.82,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, i) => ProductTile(
                    product: _products[i],
                    onTap: () => _openProduct(_products[i]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}