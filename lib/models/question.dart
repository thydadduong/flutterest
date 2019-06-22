import 'dbservice.dart';
import 'dart:convert';

class Question extends DBEntity {
  // declare property
  var id = 0;
  var nShare = [];
  var nVote = [];
  var nUse = [];
  var nFavorite = [];
  var question = "";
  var category = "";
  var dateCreated = "";
  var userId = 0;
  var visibility = "";
  var answerType = "";

  // declare table name
  @override
  var entity = "question";

  // map from json to dart object
  @override
  dynamic convertJsonToObj(dynamic jsonObj) {
    Question data = new Question();

    data.id = int.parse(jsonObj['id'].toString());
    data.userId = int.parse(jsonObj['user_id'].toString());
    data.category = jsonObj['category'].toString();
    data.question = jsonObj['question'].toString();
    data.dateCreated = jsonObj['date_created'].toString();
    data.nVote = jsonObj['vote'];
    data.nUse = jsonObj['use'];
    data.nShare = jsonObj['share'];
    data.nFavorite = jsonObj['favorite'];
    data.visibility = jsonObj['visibility'].toString();
    data.answerType = jsonObj['answer_type'].toString();

    return data;
  }

  @override
  dynamic convertObjToJson(dynamic obj) {
    var jsonObj = json.encode({
      'id': obj.id == null ? 0 : obj.id,
      'category': obj.category == null ? "" : obj.category,
      'question': obj.question == null ? "" : obj.question,
      'date_created': obj.dateCreated == null ? "" : obj.dateCreated,
      'user_id': obj.userId == null ? 0 : obj.userId,
      'visibility': obj.visibility == null ? "" : obj.visibility,
      'answer_type': obj.answerType == null ? "" : obj.answerType,
    });
    return jsonObj;
  }
}
