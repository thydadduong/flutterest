import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutterest/common_param.dart';
import 'package:flutterest/models/abstract_dao.dart';

String serverURL = "https://flutterest.herokuapp.com/";

// MAIN CLASS FOR COMMON FUNCTIONS
abstract class DBEntity extends AbstractDao {
  // DECLARE TABLE NAME
  final delayDuration = 300;
  String entity = "";

  String setURL(apiPath, [String queryString]) {
    apiPath = apiPath != null && apiPath != "" ? '/$apiPath' : "";
    queryString =
        queryString != null && queryString != "" ? '?$queryString' : "";
    return '$serverURL$entity$apiPath$queryString';
  }

  /*--------------------------
    SET LOADING = TRUE
  --------------------------*/
  // void startLoading() {
  //   CommonParam.isLoading = true;
  // }

  /*--------------------------
    SET LOADING = FALSE
  --------------------------*/
  // void endLoading() {
  //   CommonParam.isLoading = false;
  // }

  /*--------------------------
    DELAY API CALL
  --------------------------*/
  Future delayResponse() async {
    var result =
        await Future.delayed(Duration(milliseconds: delayDuration), () {
      return "Finish";
    });
    return result;
  }

  /*--------------------------
    GET BY ID
  --------------------------*/
  Future getById(int id, Function callback) async {
    final response = await doGet(setURL('getById/$id'));
    if (response.statusCode == 200) {
      var result = this.convertJsonToObj(json.decode(response.body));
      callback(result);
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  /*--------------------------
    GET ALL
  --------------------------*/
  Future<List> getAll(Function callback) async {
    final response = await doGet(setURL('getAll'));
    List<dynamic> list = [];
    if (response.statusCode == 200) {
      for (var item in json.decode(response.body)) {
        list.add(this.convertJsonToObj(item));
      }
      callback(list);
      return list;
    } else {
      throw Exception('Failed to load $entity');
    }
  }

  /*--------------------------
    GET BY PAGINATION
  --------------------------*/
  Future<List> getByLimit(int limit, int offset, Function callback) async {
    List<dynamic> list = [];
    // final response = await doGet(setURL('getByLimit/$limit/$offset'));
    final response = await doGet(setURL('getByLimit/$limit/$offset'));
    if (response.statusCode == 200) {
      for (var item in json.decode(response.body)) {
        list.add(this.convertJsonToObj(item));
      }
      callback(list);
      return list;
    } else {
      return [];
    }
  }

  /*--------------------------
    INSERT
  --------------------------*/
  Future<dynamic> insert(dynamic obj, Function callback) async {
    final response = await doPost(setURL('add'), convertObjToJson(obj));
    if (response.statusCode == 200) {
      var result = convertJsonToObj(json.decode(response.body));
      callback(result);
      return result;
    } else {
      throw Exception('Failed to insert $entity');
    }
  }

  /*--------------------------
    UPDATE
  --------------------------*/
  Future<dynamic> update(dynamic obj, Function callback) async {
    final response = await doPost(setURL('update'), convertObjToJson(obj));
    if (response.statusCode == 200) {
      var result = convertJsonToObj(json.decode(response.body));
      callback(result);
      return result;
    } else {
      throw Exception('Failed to insert $entity');
    }
  }

  /*--------------------------
    DELETE
  --------------------------*/
  Future delete(id, Function callback) async {
    final response = await doPost(setURL('delete'), json.encode({'id': id}));
    if (response.statusCode == 200) {
      callback(true);
      return true;
    } else {
      throw Exception('Failed to delete $entity');
    }
  }

  /*--------------------------
    DELETE BY MULTIPLE ATTRIBUTE
  --------------------------*/
  Future deleteByMultiAttribute(dynamic obj, Function callback) async {
    var jsonObj = convertObjToJson(obj);
    final response = await doPost(setURL('deleteMultiAttribute'), jsonObj);
    if (response.statusCode == 200) {
      callback(response);
      return true;
    } else {
      throw Exception('Failed to delete $entity');
    }
  }

  /*--------------------------
    GET BY FIELD NAME
  --------------------------*/
  Future getByFieldName(String fieldName, value, Function callback) async {
    var list = [];
    var jsonObj = json.encode({"fieldName": fieldName, "value": value});
    final response = await doPost(setURL('getByFieldName'), jsonObj);
    if (response.statusCode == 200) {
      for (var item in json.decode(response.body)) {
        list.add(this.convertJsonToObj(item));
      }
      callback(list);
      return list;
    } else {
      throw Exception('Failed to load $entity');
    }
  }

  /*--------------------------
    GET BY VALUE LIST
  --------------------------*/
  Future<List> getByValueList(
      String fieldName, List valueList, Function callback) async {
    List<dynamic> list = [];
    String valueParam = "";
    // THE FOLLOWING FOR NEED TO OPTIMIZE (USING MAP AND .TOSTRING())
    for (var value in valueList) {
      if (value.runtimeType != 'String') {
        value = value.toString();
      }
      valueParam += "_$value";
    }
    var jsonObj = json.encode({"fieldName": fieldName, "value": valueParam});
    final response = await doPost(setURL('getByValueList'), jsonObj);
    if (response.statusCode == 200) {
      for (var item in json.decode(response.body)) {
        list.add(this.convertJsonToObj(item));
      }
      callback(list);
      return list;
    } else {
      throw Exception('Failed to load $entity');
    }
  }

  Future<List> getByMultiAttribute(dynamic obj, Function callback) async {
    List<dynamic> list = [];
    var jsonObj = convertObjToJson(obj);
    var response = await doPost(setURL('getMultiAttribute'), jsonObj);
    if (response.statusCode == 200) {
      for (var item in json.decode(response.body)) {
        list.add(this.convertJsonToObj(item));
      }
      callback(list);
      return list;
    } else {
      return [];
    }
  }

  Future<List> getByMultiAttributeWithLimit(
      dynamic obj, int limit, int offset, Function callback) async {
    List<dynamic> list = [];
    var jsonObj = convertObjToJson(obj);
    var response = await doPost(
        setURL('getMultiAttributeWithLimit/$limit/$offset'), jsonObj);
    if (response.statusCode == 200) {
      for (var item in json.decode(response.body)) {
        list.add(this.convertJsonToObj(item));
      }
      callback(list);
      return list;
    } else {
      return [];
    }
  }

  Future doGet(String url) async {
    // startLoading();
    await delayResponse();
    final response = await http.get(url);
    // endLoading();
    return response;
  }

  Future doPost(String url, jsonObj) async {
    // startLoading();
    await delayResponse();
    final response = await http.post(url, body: jsonObj);
    // endLoading();
    return response;
  }

  /*
    ///FETCH ALL
   */
  Future<List> fetchAll(Function callback) async {
    print("requested");
    final response = await doGet(setURL(""));
    List<dynamic> list = [];

    if (response.statusCode == 200) {
      for (var item in json.decode(response.body)) {
        list.add(this.convertJsonToObj(item));
        callback(list);
      }
      return list;
    }
    return throw Exception("Failed to load $entity");
  }

  void printString(dynamic obj) {
    print(this.convertObjToJson(obj));
  }

  void printStringList(List list) {
    for (var item in list) {
      printString(item);
    }
  }
} // end class
