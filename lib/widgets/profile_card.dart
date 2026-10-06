import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String nim;
  final String prodiKelas;
  final double rating;

  const ProfileCard({
    super.key,
    required this.name,
    required this.nim,
    required this.prodiKelas,
    this.rating = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: Color(0xFF0A2948),
              backgroundImage: ResizeImage(
                AssetImage('assets/images/user.png'),
                width: 300,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A2948))),
                  const SizedBox(height: 4),
                  Text('NIM: $nim',
                      style: const TextStyle(color: Color(0xFF374151))),
                  Text(prodiKelas,
                      style: const TextStyle(color: Color(0xFF374151))),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (_) => const Icon(Icons.star,
                            color: Colors.amber, size: 22),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(${rating.toStringAsFixed(1)})',
                        style: const TextStyle(
                          color: Color(0xFF374151),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}