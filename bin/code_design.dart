import 'solid/conntection.dart';


void main() {
var db = Service();
db.connection= NoSql();
db.attach();
}
