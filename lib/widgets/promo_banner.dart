import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  void _onPromoTap(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color(0xFF4CAF50),
        behavior: SnackBarBehavior.floating,
        content: Text('Promo diskon hingga 20% sedang berlangsung!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      // Rasio gambar banner 3:1 (2172 x 724)
      child: AspectRatio(
        aspectRatio: 2172 / 724,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            return Stack(
              children: [
                // Lapisan bawah: gambar banner (tidak terpotong)
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/promo_banner.png',
                    fit: BoxFit.fill,
                  ),
                ),
                // Lapisan atas: area tombol "Lihat Promo"
                Positioned(
                  left: w * 0.10,
                  top: h * 0.755,
                  width: w * 0.202,
                  height: h * 0.109,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => _onPromoTap(context),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}