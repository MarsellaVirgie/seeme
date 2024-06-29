import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/comment_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> uploadPost(
      String uid, String description, String imageUrl) async {
    await _db.collection('posts').add({
      'uid': uid,
      'description': description,
      'imageUrl': imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> addComment(String postId, CommentModel comment) async {
    await _db
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .add(comment.toMap());
  }
}
