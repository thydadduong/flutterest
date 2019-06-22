import 'package:flutterest/models/test/abstract_unit_test.dart';
import 'package:flutterest/models/user.dart';

main(List<String> args) {
  UserTest test = UserTest();
  test.startTest(() {});
}

class UserTest extends AbstractUnitTester {
  UserTest() {
    searchObject = User();
    insertObject = User();

    // object.id = 100;
    // searchObject.id = 100;
    searchObject.username = "user9999";
    searchObject.id = 9999;

    insertObject.username = "TEST COMMAND";
    insertObject.password = "password";
    insertObject.type = "normal";
    insertObject.status = "active";
    insertObject.dateCreated = "2018-10-10";

    fieldName = "type";
    searchKeyword = 'normal';
    valueList = ["normal"];
    limit = 5;
    offset = 0;
  }
}
