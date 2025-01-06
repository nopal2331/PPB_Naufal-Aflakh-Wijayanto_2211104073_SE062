import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laprak13/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AddController noteController = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unguided Note App'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        elevation: 2.0,
      ),
      body: Obx(() {
        if (noteController.notes.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada catatan',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) {
            final note = noteController.notes[index];
            return NoteCard(
              title: note['title'] ?? '',
              description: note['description'] ?? '',
              onDelete: () => noteController.confirmDelete(context, index),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onDelete;

  const NoteCard({
    required this.title,
    required this.description,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}