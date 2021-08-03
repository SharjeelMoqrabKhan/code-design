class Bank {

  Bank.open(){
    _submitPaper();
    _approvalFromManger();
    _uploadingOnDb();
  }

  void _submitPaper(){

  }

  void _approvalFromManger(){

  }

  void _uploadingOnDb(){

  }

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
