main() {
  // List collection
  List threeKingdoms = [];

  // List에 데이터 추가하기
  threeKingdoms.add("위");
  threeKingdoms.add("축");
  threeKingdoms.add("오");
  threeKingdoms.add("we");

  print(threeKingdoms);

  //원하는 데이터만 출력하기
  print(threeKingdoms[0]);

  // 수정 : 위 <- we
  threeKingdoms[0] = "we";
  print(threeKingdoms);

  // List의 삭제
  // Index번호로 삭제
  threeKingdoms.removeAt(1);
  print(threeKingdoms);

  // 데이터값으로 삭제
  threeKingdoms.remove("we");
  print(threeKingdoms);

  // 데이터 갯수 파악
  print(threeKingdoms.length);

  // 숫자 등록하기
  threeKingdoms.add(4);
  print(threeKingdoms);

  // ------------
  // List의 정해진 변수 타입(Generic)의 데이터만 추가하기
  // ------------
  List<String> threeKingdoms2 = [];
  threeKingdoms2.add('We');
  // threeKingdoms2.add(1); -> error
  List<int> threeKingdoms3 = [];
  threeKingdoms3.add(1);
  // threeKingdoms3.add('we'); -> error

  // List 선언시 초기값 설정
  List<String> threeKingdoms4 = ['위', '축', '오'];
  // 위나라가 삼국을 통일 했습니다.
  print("${threeKingdoms4[0]}나라가 삼국을 통일 했습니다.");
}
