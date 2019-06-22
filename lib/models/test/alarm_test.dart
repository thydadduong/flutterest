import 'package:flutterest/models/test/abstract_unit_test.dart';
import 'package:flutterest/models/alarm.dart';

main() {
  AlarmTest test = AlarmTest();
  test.startTest(() {});
}

class AlarmTest extends AbstractUnitTester {
  AlarmTest() {
    searchObject = Alarm();
    insertObject = Alarm();

    // object.id = 100;
    // searchObject.id = 100;
    searchObject.userId = 2;
    searchObject.id = 1;

    insertObject.time = "2018-10-10 10:10";
    insertObject.userId = 2;
    insertObject.questionId = 4;
    insertObject.answerType = "Text";
    insertObject.seen = 1;
    insertObject.answered = 1;

    fieldName = "user_id";
    searchKeyword = "2";
    valueList = [2];
    limit = 5;
    offset = 0;
  }
}
