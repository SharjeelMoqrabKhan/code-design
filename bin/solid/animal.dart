abstract class Brid {
  void see();
  void run();
}
abstract class Fly{
  void fly();
}

class Eagle implements Brid ,Fly {
  @override
  void run() {}

  @override
  void see() {}

  @override
  void fly() {
   
  }
}

class Kiwi implements Brid {
  @override
  void run() {}

  @override
  void see() {}
}
