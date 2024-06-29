import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../screens/upload_screen.dart';
import '../screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Seeme'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await userProvider.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Seeme'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UploadScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
