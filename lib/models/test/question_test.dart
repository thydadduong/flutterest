import 'package:flutterest/models/test/abstract_unit_test.dart';
import 'package:flutterest/models/question.dart';

main(List<String> args) {
  QuestionTest test = QuestionTest();
  test.startTest(() {});
}

class QuestionTest extends AbstractUnitTester {
  QuestionTest() {
    searchObject = Question();
    insertObject = Question();

    // object.id = 100;
    // searchObject.id = 100;
    searchObject.question = "Question 95";
    searchObject.id = 100;

    insertObject.category = "habit";
    insertObject.question = "FROM TEST COMMAND";
    insertObject.dateCreated = "2018-09-09";
    insertObject.userId = 2;
    insertObject.visibility = 'Public';

    fieldName = "category";
    searchKeyword = 'habit';
    valueList = ["islam", "habit"];
    limit = 5;
    offset = 0;
  }
}
