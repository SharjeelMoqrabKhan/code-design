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
