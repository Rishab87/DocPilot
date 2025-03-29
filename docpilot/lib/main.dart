import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'screens/home.dart';
import 'screens/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Client client = Client()
    ..setEndpoint('https://YOUR_APPWRITE_ENDPOINT/v1')
    ..setProject('YOUR_PROJECT_ID');

  Future<bool> isSignedIn() async {
    try {
      Account account = Account(client);
      await account.get(); 
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocPilot',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: FutureBuilder<bool>(
        future: isSignedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            bool signedIn = snapshot.data ?? false;
            return signedIn ? HomeScreen() : LoginScreen(client: client);
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
      routes: {
        '/login': (context) => LoginScreen(client: client),
        '/signup': (context) => SignupScreen(client: client),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
