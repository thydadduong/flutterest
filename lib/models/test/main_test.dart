import 'package:flutterest/models/test/schedule_test.dart';

void main() async {
  List objectList = [ScheduleTest()];

  for (var object in objectList) {
    object.startTest((data) {});
  }
}
