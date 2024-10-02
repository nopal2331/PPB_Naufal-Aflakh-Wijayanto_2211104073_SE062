void main(){
  var open = 13;
  var close = 17;
  var now = 10;

  if (now > open && now < close) {
    print("toko buka");
  } else if (now == 12) {
    print("sedang istirahat");
  } else {
    print("toko tutup");
  }

  var toko = now > open ? 'Toko buka' : 'Toko tutup';
  print(toko);

  var nilai = 'b';
  switch(nilai){
    case 'a':
    print('nilai sangat bagus');
    break;
    case 'b':
    print('nilai bagus');
    break;
    case 'c':
    print('nilai cukup');
    break;
    default:
    print('tidak ada');
  }

}
