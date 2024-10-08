import 'dart:io';
import 'dart:math';

void main() {
  try {
    print('Masukkan bilangan bulat:');
    int? bilangan = int.parse(stdin.readLineSync()!); 

    if (cekPrima(bilangan)) {
      print('$bilangan adalah bilangan prima');
    } else {
      print('$bilangan bukan bilangan prima');
    }
  } catch (e) {
    print('Input tidak valid. Masukkan bilangan bulat yang benar.');
  }
}

bool cekPrima(int bilangan) {
  if (bilangan <= 1) {
    return false; 
  }

  for (int i = 2; i <= sqrt(bilangan); i++) {
    if (bilangan % i == 0) {
      return false;
    }
  }

  return true;
}
