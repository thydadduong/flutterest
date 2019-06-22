import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterest/models/photo.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isScrolledDown = true;

  ScrollController _scrollController;

  _scrollListener() {
    // print('scroll position'+ _scrollController.position.toString());
    // print('scroll direction'+ _scrollController.position.);
    print(_scrollController.position.userScrollDirection.runtimeType);

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      print("scorlled up");
      // setState(() {

      // });
    } else {
      print("scorlled down");
    }
    setState(() {
      _isScrolledDown = _scrollController.position.userScrollDirection ==
          ScrollDirection.forward;
    });
    // if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
    //     !_scrollController.position.outOfRange) {
    //   setState(() {
    //     // message = "reach the bottom";
    //   });
    // }
    // if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
    //     !_scrollController.position.outOfRange) {
    //   setState(() {
    //     // message = "reach the top";
    //   });
    // }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Photo photoList = Photo();

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: photoList.fetchAll((response) => response),
      builder: (BuildContext buildContext,
              AsyncSnapshot<List<dynamic>> snapshot) =>
          snapshot.hasData
              ? Column(children: <Widget>[
                  _isScrolledDown
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    backgroundImage: AssetImage(
                                        'assets/images/default-user.png'),
                                    radius: 50,
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    width: 30,
                                    height: 30,
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      backgroundColor: Colors.grey,
                                      child: Icon(Icons.add),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              snapshot.data.length.toString(),
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              "Posts",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              "222",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              "Followers",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              "555",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              "Following",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(),
                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        appBar: TabBar(
                          tabs: [
                            Tab(
                              icon: Icon(Icons.grid_on, color: Colors.grey),
                            ),
                            Tab(
                              icon: Icon(Icons.menu, color: Colors.grey),
                            ),
                            Tab(
                              icon: Icon(Icons.bookmark, color: Colors.grey),
                            ),
                          ],
                        ),
                        body: TabBarView(
                          children: <Widget>[
                            CustomScrollView(
                              slivers: <Widget>[
                                SliverGrid(
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent:
                                        MediaQuery.of(context).size.width / 3,
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
                                            image: NetworkImage(
                                                snapshot.data[index].url),
                                            fit: BoxFit.cover,
                                            child: InkWell(
                                              onTap: () {
                                                print('tapped ' +
                                                    snapshot.data[index].id
                                                        .toString());
                                              },
                                              onLongPress: () {
                                                print("long pressed " +
                                                    snapshot.data[index].id
                                                        .toString());
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
                            ),
                            ListView.builder(
                              itemCount: snapshot.data.length,
                              // itemExtent: 100,
                              itemBuilder: (BuildContext buildContext,
                                      int index) =>
                                  // Container(
                                  // child:
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Card(
                                          elevation: 2,
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          margin: EdgeInsets.all(0),
                                          child: Container(
                                            // height: min,
                                            child: Image(
                                              image: NetworkImage(
                                                  snapshot.data[index].url),
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
                            ),
                            ListView.builder(
                              itemCount: (snapshot.data.length / 10).round(),
                              // itemExtent: 100,
                              itemBuilder: (BuildContext buildContext,
                                      int index) =>
                                  // Container(
                                  // child:
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Card(
                                          elevation: 2,
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          margin: EdgeInsets.all(0),
                                          child: Container(
                                            // height: min,
                                            child: Image(
                                              image: NetworkImage(
                                                  snapshot.data[index].url),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ])
              : Center(child: CircularProgressIndicator()),
    );
  }
}
