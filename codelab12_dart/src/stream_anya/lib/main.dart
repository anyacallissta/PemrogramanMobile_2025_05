import 'package:flutter/material.dart';
import 'package:stream_anya/stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream by Anya',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream by Anya'),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
      )
    );
  }

  void changeColor() async {
    // await for (var eventColor in colorStream.getColorStream()) {
    //   setState(() {
    //     bgColor = eventColor;
    //   });
    // }

    colorStream.getColorStream().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }
}
