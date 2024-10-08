import 'dart:io';

void main() {
  try {
    print('Masukkan nilai:');
    int? nilai = int.parse(stdin.readLineSync()!); 
    
    if (nilai < 0) {
      print('Nilai tidak boleh negatif.');
    } else {
      String hasil = cekNilai(nilai);
      print('$nilai merupakan $hasil');
    }
  } catch (e) {
    print('Input tidak valid. Masukkan angka yang benar.');
  }
}

String cekNilai(int nilai) {
  if (nilai > 70) {
    return 'Nilai A';
  } else if (nilai > 40 && nilai <= 70) {
    return 'Nilai B';
  } else if (nilai >= 0 && nilai <= 40) {
    return 'Nilai C';
  } else {
    return '';
  }
}

