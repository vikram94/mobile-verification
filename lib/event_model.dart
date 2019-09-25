import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String eventId;
  String eventName;
  String eventType;
  String eventLocation;
  String eventDescription;
  String attendeesCount;
  String additionalInfo;
  String locationUrl;
  String imageUrl;
  String creatorId;

  int rating = 10;

  Event(
      {this.eventName,
      this.eventType,
      this.eventLocation,
      this.eventDescription,
      this.attendeesCount,
      this.additionalInfo,
      this.locationUrl,
      this.creatorId});
  Future getImageUrl() async {
    // Null check so our app isn't doing extra work.
    // If there's already an image, we don't need to get one.
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();

    try {
      var uri = new Uri.https(
        'dog.ceo',
        '/api/breeds/image/random',
      );
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      imageUrl = json.decode(responseBody)['message'];
      print(imageUrl);
    } catch (exception) {
      print(exception);
    }
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return new Event(
        eventName: map['eventName'],
        eventType: map['eventType'],
        eventLocation: map['eventlocation'],
        attendeesCount: map['attendeesCount'],
        eventDescription: map['eventDescription'],
        additionalInfo: map['additionalInfo'],
        locationUrl: map['locationUrl'],
        creatorId: map['userId']);
  }

  Event.fromSnapshot(DocumentSnapshot snapshot)
      : eventId = snapshot.documentID,
        eventName = snapshot['eventName'],
        //creationTimestamp = snapshot['creationTimestamp'],
        eventType = snapshot['eventType'],
        eventLocation = snapshot['eventLocation'],
        attendeesCount = snapshot['attendeesCount'],
        eventDescription = snapshot['eventDescription'],
        additionalInfo = snapshot['additionalInfo'],
        locationUrl = snapshot['locationUrl'];
  // ratings = List.from(snapshot['ratings']),
  // players = List.from(snapshot['players']),
  // gameReview = GameReview.fromMap(snapshot['gameReview']);
}
