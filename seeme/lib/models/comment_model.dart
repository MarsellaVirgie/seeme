import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String uid;
  final String text;
  final DateTime timestamp;

  CommentModel(
      {required this.uid, required this.text, required this.timestamp});

  factory CommentModel.fromMap(Map<String, dynamic> data) {
    return CommentModel(
      uid: data['uid'],
      text: data['text'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'text': text,
      'timestamp': timestamp,
    };
  }
}
