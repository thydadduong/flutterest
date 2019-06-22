import 'dart:convert';

import 'package:flutterest/models/dbservice.dart';

class Photo extends DBEntity {
  int id;
  String title = "";
  String url = "";
  String thumbnail = "";

  @override
  String entity = 'photos';

  @override
  dynamic convertJsonToObj(dynamic jsonObj) {
    Photo data = new Photo();

    data.id         = int.parse(jsonObj['id'].toString());
    data.title      = jsonObj['title'].toString();
    data.url        = jsonObj['url'].toString();
    data.thumbnail  = jsonObj['thumbnail'].toString();
    return data;
  }

  @override
  dynamic convertObjToJson(dynamic obj) {
    var jsonObj = json.encode({
      'id'        : obj.id,
      'title'     : obj.title,
      'url'       : obj.url,
      'thumbnail' : obj.thumbnail,
    });

    return jsonObj;
  }
}
