import 'dbservice.dart';
import 'dart:convert';

class Schedule extends DBEntity {
  // declare property
  var id = 0;
  var day = "";
  var time = "";
  var repeats = "";
  var questionId = 0;


  // declare table name
  @override
  var entity = "schedule";

  // map from json to dart object
  @override
  dynamic convertJsonToObj(dynamic jsonObj) {
    Schedule data = new Schedule();

    data.id = int.parse(jsonObj['id'].toString());
    data.day = jsonObj['day'].toString();
    data.time = jsonObj['time'].toString();
    data.repeats = jsonObj['repeats'].toString();
    data.questionId = int.parse(jsonObj['question_id'].toString());

    return data;
  }

  @override
  dynamic convertObjToJson(dynamic obj) {
    var jsonObj = json.encode({
      'id': obj.id == null ? 0 : obj.id,
      'day': obj.day == null ? "" : obj.day,
      'time': obj.time == null ? "" : obj.time,
      'repeats': obj.repeats == null ? "" : obj.repeats,
      'question_id': obj.questionId == null ? 0 : obj.questionId
    });
    return jsonObj;
  }
}
