import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Buttons App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageButtonsScreen(),
    );
  }
}

class ImageButtonsScreen extends StatelessWidget {
  const ImageButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Buttons App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container with image icon
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.image_outlined,
                size: 100,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            // Camera button
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality here
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text("Camera"),
            ),
            const SizedBox(height: 12),
            // Gallery button
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality here
              },
              icon: const Icon(Icons.photo_library),
              label: const Text("Gallery"),
            ),
            const SizedBox(height: 12),
            // Delete button
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality here
              },
              icon: const Icon(Icons.delete),
              label: const Text("Hapus Gambar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
