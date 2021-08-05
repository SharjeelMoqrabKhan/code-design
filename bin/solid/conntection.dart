class Service {
  ConnectionInterface connection ;  
  void attach() {
    connection.connect();
  }
}

abstract class ConnectionInterface {
  void connect();
}

class Sql implements ConnectionInterface {
  @override
  void connect() {
    print('Connecting to sql-server');
  }
}

class NoSql implements ConnectionInterface {
  @override
  void connect() {
    print('Connecting to Firebase');
  }
}
