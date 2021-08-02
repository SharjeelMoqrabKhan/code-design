# Abstract Class

An Abstract class in Dart is defined for those classes which contain one or more than one abstract method (methods without implementation) in them. Whereas, to declare abstract class we make use of the abstract keyword. So, it must be noted that a class declared abstract may or may not include abstract methods but if it includes an abstract method then it must be an abstract class.
## Features of Abstract Class: 
1) class containing an abstract method must be declared abstract whereas the class declared abstract may or may not have abstract methods i.e. it can have either abstract or concrete methods
2) A class can be declared abstract by using abstract keyword only.
3) A class declared as abstract can’t be initialised.
4) An abstract class can be extended, but if you inherit an abstract class then you have to make sure that all the abstract methods in it are provided with implementation.
5) Make classes losely coupled
6) Only can contain method decleration not body 

```
abstract class Person {
  String name;
  int age;
  String job;
  void work();
}
```

```
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

```