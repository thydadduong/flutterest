import 'package:flutterest/models/test/abstract_unit_test.dart';
import 'package:flutterest/models/answer.dart';

main() {
  AnswerTest test = AnswerTest();
  test.startTest(() {});
}

class AnswerTest extends AbstractUnitTester {
  AnswerTest() {
    searchObject = Answer();
    insertObject = Answer();

    // object.id = 100;
    // searchObject.id = 100;
    searchObject.userId = 2;
    searchObject.id = 1;

    insertObject.userId = 2;
    insertObject.answerType = "Text";
    insertObject.value = "Hello";
    insertObject.date = "2018-10-10 10:10";
    insertObject.alarmId = 1;

    fieldName = "user_id";
    searchKeyword = "2";
    valueList = [2];
    limit = 5;
    offset = 0;
  }
}
