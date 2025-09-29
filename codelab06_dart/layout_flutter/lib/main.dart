import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget get titleSection => Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              // Soal 1: Column di dalam Expanded, CrossAxisAlignment.start
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  Soal 2: Container untuk baris pertama dengan padding bawah 8
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      'N Seoul Tower',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    'Seoul, South Korea',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Soal 3: Icon bintang merah dan teks "41"
            const Icon(
              Icons.star,
              color: Colors.red,
            ),
            const Text('41'),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'The N Seoul Tower, officially the YTN Seoul Tower and '
        'also known as the Namsan Tower, is a communication and observation tower '
        'located on the summit of Namsan in central Seoul, South Korea. '
        'The 236-metre-tall structure marks the second highest point in Seoul '
        'and is considered a local landmark. \n\n'
        'Anya Callissta Chriswantari | 2341720234',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Anya Callissta Chriswantari | 2341720234',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/namsan-tower.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}