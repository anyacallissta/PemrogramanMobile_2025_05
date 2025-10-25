import 'package:camera/camera.dart';
import 'package:camera_flutter/widget/takepicture_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Pastikan plugin kamera siap sebelum runApp()
  WidgetsFlutterBinding.ensureInitialized();

  // Dapatkan daftar kamera dari perangkat
  final cameras = await availableCameras();

  // Pilih kamera pertama (biasanya kamera belakang)
  final firstCamera = cameras.first;

  // Jalankan aplikasi utama
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: firstCamera),
    ),
  );
}
