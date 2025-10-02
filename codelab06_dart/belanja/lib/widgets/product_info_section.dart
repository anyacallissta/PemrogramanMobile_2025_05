import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ProductInfoSection extends StatelessWidget {
  final Item item;

  const ProductInfoSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 📝 Nama Produk
        Text(
          item.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),

        // 💰 Harga Produk
        Text(
          'Rp ${item.price}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
        const SizedBox(height: 8),

        // ⭐ Terjual & Rating
        Row(
          children: [
            Text(
              '${item.sold} Terjual',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const SizedBox(width: 4),
            Text(
              item.rating.toString(),
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // 📦 Stok
        Text(
          'Stok: ${item.stock}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}