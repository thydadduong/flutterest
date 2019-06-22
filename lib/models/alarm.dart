import 'dbservice.dart';
import 'dart:convert';

class Alarm extends DBEntity {
  // declare property
  var id = 0;
  var time = "";
  var userId = 0;
  var questionId = 0;
  var answerType = "";
  var seen = 0;
  var answered = 0;


  // declare table name
  @override
  var entity = "alarm";

  // map from json to dart object
  @override
  dynamic convertJsonToObj(dynamic jsonObj) {
    Alarm data = new Alarm();

    data.id = int.parse(jsonObj['id'].toString());
    data.time = jsonObj['time'].toString();
    data.userId = int.parse(jsonObj['user_id'].toString());
    data.questionId = int.parse(jsonObj['question_id'].toString());
    data.answerType = jsonObj['answer_type'].toString();
    data.seen = int.parse(jsonObj['seen'].toString());
    data.answered = int.parse(jsonObj['answered'].toString());

    return data;
  }

  @override
  dynamic convertObjToJson(dynamic obj) {
    var jsonObj = json.encode({
      'id': obj.id == null ? 0 : obj.id,
      'time': obj.time == null ? "" : obj.time,
      'user_id': obj.userId == null ? "" : obj.userId,
      'question_id': obj.questionId == null ? "" : obj.questionId,
      'answer_type': obj.answerType == null ? 0 : obj.answerType,
      'seen': obj.seen == null ? 0 : obj.seen,
      'answered': obj.answered == null ? 0 : obj.answered
    });

    return jsonObj;
  }
}
