// 입력숫자 : [34,32,55,57,59,53,90,88,88,12]

main() {
  List<int> numInput = [34, 32, 55, 57, 59, 53, 90, 88, 88, 12];
  List<int> histogram = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  String r = '#';
  String blank = '';
  for (int i = 0; i < numInput.length; i++) {
    histogram[numInput[i] ~/ 10]++;
  }
  for (int y = histogram.length - 1; y >= 0; y--) {
    if (histogram == 0) {
      print('${y * 10} : $blank');
    } else {
      print('${y * 10} : ${r * histogram[y]}');
    }
  }
}


///
///i = 0 numInput list /10 몫
///3
///histogram [3]++;
///histogram[0,0,0,2,0,0,0,0,0]