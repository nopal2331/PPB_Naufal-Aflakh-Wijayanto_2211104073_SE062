import 'package:flutter/material.dart';
import 'package:laprak/helper/db_helper.dart';

class MyDbView extends StatefulWidget {
  const MyDbView({super.key});

  @override
  State<MyDbView> createState() => _MyDbViewState();
}

class _MyDbViewState extends State<MyDbView> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> row = {
        'nama': _namaController.text,
        'nim': _nimController.text,
        'alamat': _alamatController.text,
        'hobi': _hobiController.text,
      };

      await DatabaseHelper().insert(row);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil disimpan!')),
      );

      _resetForm();
    }
  }

  void _resetForm() {
    _namaController.clear();
    _nimController.clear();
    _alamatController.clear();
    _hobiController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Biodata Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _nimController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.confirmation_number),
                  labelText: 'NIM',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM tidak boleh kosong';
                  }
                  if (value.length < 5) {
                    return 'NIM harus minimal 5 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.home),
                  labelText: 'Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _hobiController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.local_activity),
                  labelText: 'Hobi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Hobi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _saveData,
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: _resetForm,
                child: const Text(
                  'Reset Form',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}