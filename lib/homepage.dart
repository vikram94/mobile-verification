// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mobile_authentication/request_model.dart';

// class HomePage extends StatelessWidget {
//   StreamSubscription<QuerySnapshot> reqSub;

//   Stream<QuerySnapshot> getRequestforEventAndUser({int offset, int limit}) {
//     Stream<QuerySnapshot> snapshots = Firestore.instance
//         .collection("events")
//         .where('eventId', isEqualTo: 'LlDDWRv4-lopF3gu_u2')
//         .where('userId', isEqualTo: 'Ro85GcrX7LdOJUTYbOop8aPcNGH2')
//         .snapshots();

//     if (offset != null) {
//       snapshots = snapshots.skip(offset);
//     }

//     if (limit != null) {
//       snapshots = snapshots.take(limit);
//     }

//     return snapshots;
//   }
//   //eventSub?.cancel();

//   // getRequestforEventAndUser() async {
//   //   QuerySnapshot document = await Firestore.instance
//   //       .collection("request")
//   //       .where('eventId', isEqualTo: 'LlDDWRv4-lopF3gu_u2')
//   //       .where('userId', isEqualTo: 'Ro85GcrX7LdOJUTYbOop8aPcNGH2')
//   //       .get();

//   //   //User user = User.fromSnapshot(document);
//   // }

//   void initState() {
//     reqSub = getRequestforEventAndUser().listen((QuerySnapshot snapshot) {
//       final List<Request> requests = snapshot.documents
//           .map((documentSnapshot) => Request.fromMap(documentSnapshot.data))
//           .toList();
//       print("requests $requests");
//       setState(() {
//         // for (int i = 0; i < events.length; i++) {
//         //   Event event = events[i];
//         //   if (event.creatorId == this.widget.userId) {
//         //     creatorEventsList.add(event);
//         //   } else {
//         //     allEventsList.add(event);
//         //   }
//         // }
//         // print(creatorEventsList);
//         // print(allEventsList);
//         // loader = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       child: new Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[new Text("data")],
//       ),
//     );
//   }
// }
