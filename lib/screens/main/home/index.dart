import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  Future<List> fetchAds() async {
    //the link you want to data from, goes inside get
    final response =
        await http.get('https://my.api.mockaroo.com/photos?key=d131acb0');

    if (response.statusCode == 200) return json.decode(response.body);
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchAds(),
        builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot
                .hasData
            ? ListView.builder(
                itemCount: snapshot.data.length,
                // itemExtent: 100,
                itemBuilder: (BuildContext buildContext, int index) =>
                    // Container(
                    // child:
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Card(
                            elevation: 2,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            margin: EdgeInsets.all(0),
                            child: Container(
                              // height: min,
                              child: Image(
                                image:
                                    NetworkImage(snapshot.data[index]['url']),
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text((index + 1).toString() +
                                  ". " +
                                  snapshot.data[index]['title']),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_horiz),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                padding: EdgeInsets.all(18),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
