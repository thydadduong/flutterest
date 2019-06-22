import 'package:flutter_test/flutter_test.dart';
// import 'package:test_api/test_api.dart';
import 'dart:async';
// https://pub.dartlang.org/packages/test

abstract class AbstractUnitTester {
  dynamic convertJsonToObj(dynamic json) {}
  dynamic convertObjToJson(dynamic obj) {}
  // dynamic object;
  // dynamic emptyObj;
  dynamic searchObject;
  dynamic insertObject;
  String fieldName;
  String searchKeyword;
  List valueList;
  int limit;
  int offset;

  Future startTest(Function callback) async {
    String entity = searchObject.entity;
    test("$entity: Get By ID", () async {
      await searchObject.getById(searchObject.id, (response) {
        if (response != null) {
          expect(response.id, greaterThan(0));
        }
      });
    });

    test("$entity: getAll", () async {
      await searchObject.getAll((response) {
        if (response != null) {
          expect(response[0].id, greaterThan(0));
        }
      });
    });

    test("$entity: getByLimit", () async {
      await searchObject.getByLimit(limit, offset, (response) {
        if (response != null) {
          expect(response[0].id, greaterThan(0));
        }
      });
    });

    test("$entity: getByFieldName ", () async {
      await searchObject.getByFieldName(fieldName, searchKeyword, (response) {
        if (response != null) {
          expect(response[0].id, greaterThan(0));
        }
      });
    });

    test("$entity: getByValueList ", () async {
      await searchObject.getByValueList(fieldName, valueList, (response) {
        if (response != null) {
          expect(response[0].id, greaterThan(0));
        }
      });
    });

    test("$entity: getByMultiAttribute ", () async {
      await searchObject.getByMultiAttribute(searchObject, (response) {
        if (response != null) {
          expect(response[0].id, greaterThan(0));
        }
      });
    });

    test("$entity: getByMultiAttributeWithLimit ", () async {
      await searchObject.getByMultiAttributeWithLimit(
          searchObject, limit, offset, (response) {
        if (response != null) {
          expect(response[0].id, greaterThan(0));
          // fail(response.toString());
        }
      });
    });

    test("$entity: insert & delete", () async {
      await insertObject.insert(insertObject, (response) {
        if (response != null) {
          expect(response.id, greaterThan(0));
          // insertObject.printString(response);
          searchObject.printString(response);
          insertObject.delete(response.id, (responseD) {
            expect(responseD, true);
          });
        }
      });
    });
  }

// output json string
  void printString(dynamic obj) {}
  void printStringList(List list) {}
}
