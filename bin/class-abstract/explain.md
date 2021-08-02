# Class and Object

A class can be blue-print of any object. In simple words we can make a stucture of any real world entity via class and can use it as many time as we want via object.
A class has properties and methods. Properties also knwon attribuites and methods are behaviour.
Contructor is used for intialized the object value.

Classes provide an easy way of keeping the data members and methods together in one place which helps in keeping the program more organized.
Using classes also provides another functionality of this object-oriented programming paradigm, that is, inheritance.
Classes also help in overriding any standard operator.
Using classes provides the ability to reuse the code which makes the program more efficient.
Grouping related functions and keeping them in one place (inside a class) provides a clean structure to the code which increases the readability of the program.
### example

```
class Person {
  Person({this.name, this.age, this.job});
  String name;
  int age;
  String job;

  void walk(){
    print('a Person can walk');
  }
}
```
