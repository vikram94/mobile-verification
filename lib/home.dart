import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_authentication/event_model.dart';
import 'package:mobile_authentication/request_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<QuerySnapshot> reqSub;

  Stream<QuerySnapshot> getRequestforEventAndUser({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = Firestore.instance
        .collection("request")
        .where('eventId', isEqualTo: '-LlDDWRv4-lopF3gu_u2')
        .where('userId', isEqualTo: 'Ro85GcrX7LdOJUTYbOop8aPcNGH2')
        .snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }
  //eventSub?.cancel();

  getEventDetails(String eventId) async {
    DocumentSnapshot document =
        await Firestore.instance.document("events/$eventId").get();

    Event event = Event.fromSnapshot(document);
    print("event from snapshot $event");
  }

  void initState() {
    reqSub = getRequestforEventAndUser().listen((QuerySnapshot snapshot) {
      final List<Request> requests = snapshot.documents
          .map((documentSnapshot) => Request.fromMap(documentSnapshot.data))
          .toList();
      print("requests $requests");
      setState(() {
        for (int i = 0; i < requests.length; i++) {
          var eventId = requests[i].eventId;
          print(eventId);
          getEventDetails(eventId);
        }
        //   if (event.creatorId == this.widget.userId) {
        //     creatorEventsList.add(event);
        //   } else {
        //     allEventsList.add(event);
        //   }
        // }
        // print(creatorEventsList);
        // print(allEventsList);
        // loader = false;
      });
    });
  }

  apicall() {
    reqSub = getRequestforEventAndUser().listen((QuerySnapshot snapshot) {
      final List<Request> requests = snapshot.documents
          .map((documentSnapshot) => Request.fromMap(documentSnapshot.data))
          .toList();
      print("requests $requests");
      setState(() {
        for (int i = 0; i < requests.length; i++) {
          var eventId = requests[i].eventId;
          print(eventId);
          getEventDetails(eventId);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("data"),
          new RaisedButton(
            onPressed: apicall,
          )
        ],
      ),
    );
  }
}
