import 'package:flutterest/models/test/abstract_unit_test.dart';
import 'package:flutterest/models/schedule.dart';

main(List<String> args) {
  ScheduleTest test = ScheduleTest();
  test.startTest(() {});
}

class ScheduleTest extends AbstractUnitTester {
  ScheduleTest() {
    searchObject = Schedule();
    insertObject = Schedule();

    // object.id = 100;
    // searchObject.id = 100;
    searchObject.day = "Monday";
    searchObject.id = 1;
    
    insertObject.day = "Tuesday";
    insertObject.time = "2018-09-09 10:00";
    insertObject.repeats = "weekly";
    insertObject.questionId = 20;

    fieldName = "question_id";
    searchKeyword = '3';
    valueList = ["3"];
    limit = 5;
    offset = 0;
  }
}
