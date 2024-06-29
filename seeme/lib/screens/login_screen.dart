import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masuk ke Seeme'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await Provider.of<UserProvider>(context, listen: false)
                .signInWithGoogle();
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}
