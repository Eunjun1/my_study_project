main() {
  List<int> list1 = [1, 3, 5, 7, 9];
  /*
  int sum = 0;
  for (int li in list1) {
    sum += li;
  }

  print('합계 : $sum');
*/
  // ------------------------------

  List<int> list2 = [10, 30, 50, 70, 90];
  /*
  int sum2 = 0;
  for (int li in list2) {
    sum2 += li;
  }

  print('합계 : $sum2');
*/
  // 동일한 기능의 코드인데 중복되어 코딩함.
  addList(list2);
  addList(list1);
  int sum1 = addList(list1);
  print("리스트의 합계는 $sum1입니다.");
  int sum2 = addList(list2);
  print("리스트의 합계는 $sum2입니다.");
}

int addList(List<int> listName) {
  int sum = 0;
  for (int li in listName) {
    sum += li;
  }
  return sum;
}
