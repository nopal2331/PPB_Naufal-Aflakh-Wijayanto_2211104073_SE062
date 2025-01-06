import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  // Observable list to store notes
  var notes = <Map<String, String>>[].obs;

  /// Add a new note
  void addNote(String title, String description) {
    if (title.isNotEmpty && description.isNotEmpty) {
      notes.add({'title': title, 'description': description});
      showSnackbar('Berhasil', 'Catatan berhasil ditambahkan', Colors.green);
    } else {
      showSnackbar('Tidak dapat menyimpan', 'Harap isi dengan benar', Colors.red);
    }
  }

  /// Delete a note by index
  void deleteNote(int index) {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
      showSnackbar('Berhasil', 'Catatan berhasil dihapus', Colors.blue);
    } else {
      showSnackbar('Gagal', 'Index tidak valid', Colors.red);
    }
  }

  /// Show a confirmation dialog before deleting a note
  void confirmDelete(BuildContext context, int index) {
    Get.defaultDialog(
      title: 'Konfirmasi Hapus',
      middleText: 'Apakah yakin untuk menghapus catatan ini?',
      textConfirm: 'Hapus',
      textCancel: 'Batal',
      confirmTextColor: Colors.white,
      onConfirm: () {
        deleteNote(index);
        Get.back();
      },
      onCancel: () {},
    );
  }

  /// Show a custom snackbar
  void showSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      icon: Icon(
        backgroundColor == Colors.red ? Icons.error : Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  void snackBar() {}
}