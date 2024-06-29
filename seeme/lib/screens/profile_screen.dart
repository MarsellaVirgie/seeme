import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.photoUrl),
                  ),
                  SizedBox(height: 16),
                  Text(user.displayName, style: TextStyle(fontSize: 24)),
                  SizedBox(height: 8),
                  Text(user.email, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
    );
  }
}
