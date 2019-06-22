import 'dbservice.dart';
import 'dart:convert';

class Uaction extends DBEntity {
  // declare property
  var id;
  var userId;
  var questionId;
  var type;
  var date;

  // declare table name
  @override
  String entity = "uaction";

  // map from json to dart object6
  @override
  dynamic convertJsonToObj(dynamic json) {
    Uaction data = new Uaction();
    data.id = json['id'];
    data.userId = int.parse(json['user_id'].toString());
    data.questionId = int.parse(json['question_id'].toString());
    data.type = json['type'].toString();
    data.date = json['date'].toString();

    return data;
  }

  @override
  dynamic convertObjToJson(dynamic obj) {
    var jsonObj = json.encode({
      'id': obj.id == null ? 0 : obj.id,
      'user_id': obj.userId == null ? "" : obj.userId,
      'question_id': obj.questionId == null ? "" : obj.questionId,
      'type': obj.type == null ? "" : obj.type,
      'date': obj.date == null ? "" : obj.date,
    });
    return jsonObj;
  }
}
