import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Seeme',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<UserProvider>(
          builder: (context, userProvider, _) {
            if (userProvider.user == null) {
              return LoginScreen();
            } else {
              return HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
