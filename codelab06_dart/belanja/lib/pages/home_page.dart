import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Cat Choize Tuna Adult',
      price: 18000,
      image: 'images/cc.jpg',
      stock: 50,
      rating: 4.8,
      sold: 120,
      desc: 'Cat Choize Tuna Adult adalah makanan kucing kering bergizi dengan rasa tuna yang lezat, membantu menjaga kesehatan bulu dan pencernaan kucing dewasa. Mengandung protein tinggi serta vitamin dan mineral penting. Berat: 800g',
    ),
    Item(
      name: 'Ori Cat Tuna Adult',
      price: 22000,
      image: 'images/oc.jpg',
      stock: 55,
      rating: 4.8,
      sold: 80,
      desc: 'Ori Cat Tuna Adult adalah makanan kucing kering dengan rasa tuna, diformulasikan khusus untuk kucing dewasa. Mengandung protein tinggi, vitamin, dan mineral untuk menjaga kesehatan bulu, pencernaan, dan daya tahan tubuh. Berat: 800g',
    ),
    Item(
      name: 'Me-O Salmon Adult',
      price: 55000,
      image: 'images/me-o.jpeg',
      stock: 38,
      rating: 4.8,
      sold: 30,
      desc: 'Me-O Salmon Adult diformulasikan untuk memenuhi kebutuhan nutrisi kucing dewasa dengan rasa salmon yang lezat. Berat: 400g',
    ),
    Item(
      name: 'Pro Plan Chicken Kitten',
      price: 230000,
      image: 'images/proplan.jpg',
      stock: 42,
      rating: 5,
      sold: 54,
      desc: 'Pro Plan Kitten dengan rasa ayam diformulasikan khusus untuk anak kucing, mendukung pertumbuhan optimal dan sistem imun yang kuat. Berat: 1,5kg',
    ),
    Item(
      name: 'Royal Canin Persian Adult',
      price: 88000,
      image: 'images/rc.jpg',
      stock: 46,
      rating: 5,
      sold: 66,
      desc: 'Royal Canin Persian Adult mendukung kesehatan bulu, pencernaan, dan kebutuhan nutrisi kucing Persia dewasa. Berat: 400g',
    ),
    Item(
      name: 'Whiskas Tuna Adult',
      price: 65000,
      image: 'images/whiskas.jpg',
      stock: 43,
      rating: 4.9,
      sold: 47,
      desc: 'Whiskas Tuna Adult memberikan nutrisi lengkap dan seimbang untuk kucing dewasa dengan rasa tuna yang disukai. Berat: 1.2kg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          // Bagian Grid Produk
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(item: items[index]);
                },
              ),
            ),
          ),

          // Footer Nama & NIM
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 84, 76, 49),
            child: const Text(
              'Anya Callissta Chriswantari | 2341720234',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
