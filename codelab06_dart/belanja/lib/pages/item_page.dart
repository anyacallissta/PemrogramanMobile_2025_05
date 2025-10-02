import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/product_image_hero.dart';
import 'package:belanja/widgets/product_info_section.dart';
import 'package:belanja/widgets/product_description.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 76, 49),
        foregroundColor: Colors.white,
        title: Row(
          children: const [
            Icon(Icons.pets),
            SizedBox(width: 8),
            Text('Pet Shop'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kolom kiri - Gambar produk
            Expanded(
              flex: 1,
              child: ProductImageHero(imagePath: item.image),
            ),

            const SizedBox(width: 16),

            // Kolom kanan - Info & Deskripsi
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInfoSection(item: item),
                  const SizedBox(height: 16),
                  ProductDescription(desc: item.desc),
                ],
              ),
            ),
          ],
        ),
      ),

      // Footer Nama dan NIM
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 84, 76, 49),
        child: const Text(
          'Anya Callissta Chriswantari | 2341720234',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
