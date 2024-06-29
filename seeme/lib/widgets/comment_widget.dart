import 'package:flutter/material.dart';
import '../models/comment_model.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;

  CommentWidget({required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment.text),
      subtitle: Text(comment.uid),
      trailing: Text(comment.timestamp.toString()),
    );
  }
}
