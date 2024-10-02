void main() {
  List<int> fixedList = List.filled(4, 1);

  fixedList[0] = 5;
  fixedList[1] = 10;
  fixedList[2] = 15;
  fixedList[3] = 20;

  print('Fixed Length List: $fixedList');

  List<int> growableList = [];

  growableList.add(100);
  growableList.add(200);
  growableList.add(300);
  growableList.add(400);

  print('Growable List before removal: $growableList');

  growableList.remove(200);

  print('Growable List after removal: $growableList');

  growableList.add(500);
  growableList.add(600);

  print('Updated Growable List: $growableList');
}

