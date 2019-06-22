import 'package:flutter/material.dart';
import 'package:flutterest/models/photo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Photo photo = new Photo();
    // Future<List> photoList = photo.fetchAll((response) => response);

    return Scaffold(
      body: FutureBuilder(
        future: photo.fetchAll((response) {
          return response;
        }),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) => snapshot
                .hasData
            ? ListView.builder(
                itemCount: snapshot.data.length,
                // itemExtent: 100,
                itemBuilder: (BuildContext buildContext, int index) =>
                    // Container(
                    // child:
                    Column(
                      // mainAxisSize: MainAxisSize.max,
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
                                image: NetworkImage(snapshot.data[index].url),
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text((index + 1).toString() +
                                  ". " +
                                  snapshot.data[index].title),
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
