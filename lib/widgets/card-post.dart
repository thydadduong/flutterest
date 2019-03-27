// import 'package:flutter/material.dart';

// class CardPost extends StatelessWidget {
//   // Object cardInfo = {};
//   // CardPost
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       height: 408,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Expanded(
//             child: Card(
//               elevation: 2,
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.0)),
//               margin: EdgeInsets.all(0),
//               child: Image(
//                 image: NetworkImage(snapshot.data[index]['url']),
//                 width: double.infinity,
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//           ),
//           // SizedBox(height: 4),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: Text((index + 1).toString() +
//                     ". " +
//                     snapshot.data[index]['title']),
//               ),
//               IconButton(
//                 icon: Icon(Icons.more_horiz),
//                 splashColor: Colors.transparent,

//                 // highlightColor: null,
//                 onPressed: () {},
//               )
//             ],
//           )
//         ],
//       ),
//       padding: EdgeInsets.all(8),
//     );
//   }
// }
