import 'dbservice.dart';
import 'dart:convert';

class Answer extends DBEntity {
  // declare property
  var id = 0;
  var userId = 0;
  var answerType = "";
  var value = "";
  var date = "";
  var alarmId = 0;


  // declare table name
  @override
  var entity = "answer";

  // map from json to dart object
  @override
  dynamic convertJsonToObj(dynamic jsonObj) {
    Answer data = new Answer();

    data.id = int.parse(jsonObj['id'].toString());
    data.userId = int.parse(jsonObj['user_id'].toString());
    data.answerType = jsonObj['answer_type'].toString();
    data.value = jsonObj['value'].toString();
    data.date = jsonObj['date'].toString();
    data.alarmId = int.parse(jsonObj['alarm_id'].toString());

    return data;
  }

  @override
  dynamic convertObjToJson(dynamic obj) {
    var jsonObj = json.encode({
      'id': obj.id == null ? 0 : obj.id,
      'user_id': obj.userId == null ? 0 : obj.userId,
      'answer_type': obj.answerType == null ? 0 : obj.answerType,
      'value': obj.value == null ? 0 : obj.value,
      'date': obj.date == null ? 0 : obj.date,
      'alarm_id': obj.alarmId == null ? 0 : obj.alarmId,
    });

    return jsonObj;
  }
}
