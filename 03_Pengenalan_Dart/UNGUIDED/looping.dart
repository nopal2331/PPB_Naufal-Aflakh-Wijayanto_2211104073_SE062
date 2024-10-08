import 'dart:io';

void main() {
  int? baris;

  while (baris == null || baris <= 0) {
    stdout.write('Masukkan jumlah baris piramida (harus positif): ');
    try {
      baris = int.parse(stdin.readLineSync()!);
      if (baris <= 0) {
        print('Jumlah baris harus bilangan positif.');
      }
    } catch (e) {
      print('Input tidak valid. Masukkan bilangan bulat yang benar.');
    }
  }

  for (int i = 1; i <= baris; i++) {
    for (int j = i; j < baris; j++) {
      stdout.write(' ');
    }

    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }

    print('');
  }
}
