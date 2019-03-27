import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Widget build(BuildContext context) {
    Image image = new Image.network('https://secure.img1-fg.wfcdn.com/im/83549772/resize-h800-w800%5Ecompr-r85/3670/36706786/Teacup+Labrador+Puppy+Statue.jpg');
    Completer<ui.Image> completer = new Completer<ui.Image>();
    image.image.resolve(new ImageConfiguration()).addListener(
        (ImageInfo info, bool _) => completer.complete(info.image));
    return ListView(
      children: [
        image,
        new FutureBuilder<ui.Image>(
          future: completer.future,
          builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
            if (snapshot.hasData) {
              return new Text(
                '${snapshot.data.width}x${snapshot.data.height}',
                style: Theme.of(context).textTheme.display3,
              );
            } else {
              return new Text('Loading...');
            }
          },
        ),
      ],
    );
  }
}
