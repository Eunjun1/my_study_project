main() {
  int n1 = 10;
  int n2 = 20;

  Add add = Add(n1, n2);

  print('덧셈결과 = ${add.addition()}');

  Sub sub = Sub(n1, n2);

  print('덧셈결과 = ${sub.addition()}');
  print('덧셈결과 = ${sub.subtraction()}');
} // main

class Add {
  late int num1 = 0;
  late int num2 = 0;

  Add(num1, num2) : this.num1 = num1, this.num2 = num2;

  int addition() {
    return this.num1 + this.num2;
  }
}

//상속
class Sub extends Add {
  Sub(super.num1, super.num2);

  int subtraction() {
    return num1 - num2;
  }
}
