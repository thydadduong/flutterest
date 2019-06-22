// import 'dart:async';
// import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutterest/models/photo.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // var testObj = {"name": "Notifications"};

  // var test;

  Widget build(BuildContext context) {
    // Image image = new Image.network(
    //     'https://secure.img1-fg.wfcdn.com/im/83549772/resize-h800-w800%5Ecompr-r85/3670/36706786/Teacup+Labrador+Puppy+Statue.jpg');
    // Completer<ui.Image> completer = new Completer<ui.Image>();
    // image.image.resolve(new ImageConfiguration()).addListener(
    //     (ImageInfo info, bool _) => completer.complete(info.image));
    // return ListView(
    //   children: [
    //     image,
    //     new FutureBuilder<ui.Image>(
    //       future: completer.future,
    //       builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
    //         if (snapshot.hasData) {
    //           return new Text(
    //             '${snapshot.data.width}x${snapshot.data.height}',
    //             style: Theme.of(context).textTheme.display3,
    //           );
    //         } else {
    //           return new Text('Loading...');
    //         }
    //       },
    //     ),
    //   ],
    // );

    Photo photoList = Photo();

    return FutureBuilder(
      future: photoList.fetchAll((response) => response),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Demo',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              // Text("data"),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
                  // mainAxisSpacing: 0.0,
                  // crossAxisSpacing: 0.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Ink.image(
                          image: NetworkImage(snapshot.data[index].url),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () {
                              print('tapped ' +
                                  snapshot.data[index].id.toString());
                            },
                            onLongPress: () {
                              print("long pressed " +
                                  snapshot.data[index].id.toString());
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: snapshot.data.length,
                ),
              )
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
