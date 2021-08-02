abstract class Person {
  String name;
  int age;
  String job;
  void work();
}

class Software implements Person {
  Software({this.name,this.age,this.job});

  @override
  int age;
  @override
  String job;
  @override
  String name;

  @override
  void work() {
    print('Coding Job');
  }
}
