import 'dbservice.dart';
import 'dart:convert';

class User extends DBEntity {
  // declare property
  int id;
  String username;
  String password;
  String type;
  String status;
  String dateCreated;

  // declare table name
  @override
  String entity = "user";

  // map from json to dart object
  @override
  dynamic convertJsonToObj(dynamic jsonObj) {
    User data = new User();
    data.id = int.parse(jsonObj['id'].toString());
    data.username = jsonObj['username'].toString();
    data.password = jsonObj['password'].toString();
    data.type = jsonObj['type'].toString();
    data.status = jsonObj['status'].toString();
    data.dateCreated = jsonObj['created'].toString();

    return data;
  }

  dynamic convertObjToJson(dynamic obj) {
    var jsonObj = json.encode({
      'id': obj.id == null ? 0 : obj.id,
      'username': obj.username == null ? "" : obj.username,
      'password': obj.password == null ? "" : obj.password,
      'type': obj.type == null ? "" : obj.type,
      'status': obj.status == null ? "" : obj.status,
      'created': obj.dateCreated == null ? "" : obj.dateCreated,
    });
    return jsonObj;
  }
}
