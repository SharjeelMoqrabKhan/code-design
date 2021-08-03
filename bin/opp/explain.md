## Encapsulation

Encapsulation in OOP is ‘a mechanism of wrapping the data (variables) and code acting on the data (methods) together as a single unit.’ For example, a capsule which is mixed of several medicines.

In encapsulation, the variables of a class will be hidden from other classes, and can be accessed only through the methods of their current class. Therefore, it is also known as data hiding.

```
1) To achieve encapsulation in Dart − 
2) Declare the variables of a class as private. 
3) Provide public setter and getter methods to modify and view the variables values.
```
![alt](https://www.cpp.thiyagaraaj.com/cms/assets/cimages/encapsulation.png)

```
class Bank {
  num _balance = 0;

  void withdraw(num amount) {
    if (amount >= 0) {
      _balance -= amount;
    } else {
      throw Exception('Amount can\'t be less than zero');
    }
  }

  void deposit(num amount) {
    if (amount >= 0) {
      _balance += amount;
    } else {
      throw Exception('Amount can\'t be less than zero');
    }
  }

  num getBalance() {
    return _balance;
  }
}

```

```
import 'opp/abstraction/bank.dart';

void main() {
var bank = Bank(); 
bank.deposit(500);
print(bank.getBalance());
bank.withdraw(475.50);
print(bank.getBalance());
bank.deposit(60);
print(bank.getBalance());
}
```