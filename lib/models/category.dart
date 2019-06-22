import 'dbservice.dart';
import 'dart:convert';

class Category extends DBEntity {
  // declare property
  int id;
  String name;

  // declare table name
  @override
  String entity = "category";

  // map from json to dart object
  @override
  dynamic convertJsonToObj(dynamic jsonObj) {
    Category data = new Category();

    data.id = int.parse(jsonObj['id'].toString());
    data.name = jsonObj['name'].toString();

    return data;
  }

  @override
  dynamic convertObjToJson(dynamic obj) {
    var jsonObj = json.encode({
      'id': obj.id == null ? 0 : obj.id,
      'name': obj.name == null ? "" : obj.name,
    });
    return jsonObj;
  }
}
