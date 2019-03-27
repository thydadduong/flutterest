import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Following extends StatelessWidget {
  Future<List> fetchAds() async {
    //the link you want to data from, goes inside get
    final response = await http
        .get('https://my.api.mockaroo.com/photos?key=d131acb0');

    if (response.statusCode == 200) return json.decode(response.body);
    return [];
  }

  String _getImageUrl(String url) {
    return url != null && url != ""
        ? url
        : "https://uae.microless.com/cdn/no_image.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchAds(),
        builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot
                .hasData
            ? StaggeredGridView.count(
                crossAxisCount: 4,
                children: snapshot.data.map<Widget>((item) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Card(
                            elevation: 2,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            margin: EdgeInsets.all(0),
                            child: Image(
                              image:
                                  NetworkImage(_getImageUrl(item['url'])),
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(item['title'], maxLines: 2,),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_horiz),
                              splashColor: Colors.transparent,

                              // highlightColor: null,
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                  );
                }).toList(),
                staggeredTiles: snapshot.data
                    .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                    .toList(),
                // .toList(),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
