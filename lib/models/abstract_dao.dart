import 'dart:async';

abstract class AbstractDao {
  // mapping before requesting the api and after receiving api response
  dynamic convertJsonToObj(dynamic json);
  dynamic convertObjToJson(dynamic obj);

  // searching
  Future getById(int id, Function callback);

  Future<List> getAll(Function callback);

  Future<List> getByLimit(int limit, int offset, Function callback);

  Future getByFieldName(String fieldName, value, Function callback);

  Future<List> getByValueList(
      String fieldName, List valueList, Function callback);

  Future<List> getByMultiAttribute(dynamic obj, Function callback);

  Future<List> getByMultiAttributeWithLimit(
      dynamic obj, int limit, int offset, Function callback);

  // insert
  Future<dynamic> insert(dynamic obj, Function callback);

  // update
  Future<dynamic> update(dynamic obj, Function callback);

  // delete
  Future delete(id, Function callback);

  Future deleteByMultiAttribute(dynamic obj, Function callback);

  // output json string
  void printString(dynamic obj);
  void printStringList(List list);
}

//todo: local database
//todo: global state
//todo: api controller
