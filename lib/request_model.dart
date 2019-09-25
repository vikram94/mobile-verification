import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  String eventId;
  String userId;
  String status;

  Request({
    this.eventId,
    this.userId,
    this.status,
  });

  factory Request.fromMap(Map<String, dynamic> map) {
    return new Request(
      eventId: map['eventId'],
      userId: map['userId'],
      status: map['status'],
    );
  }

  Request.fromSnapshot(DocumentSnapshot snapshot)
      : //eventId = snapshot.documentID,
        eventId = snapshot['eventId'],
        userId = snapshot['userId'],
        status = snapshot['status'];
}
