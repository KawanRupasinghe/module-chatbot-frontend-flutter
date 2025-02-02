import 'package:flutter/material.dart';
import 'components/LoginForm.dart';
import 'components/Dashboard.dart';
import 'components/ChatWindow.dart'; // Import ChatWindow

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatbot App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginForm(),
        '/dashboard': (context) => Dashboard(userEmail: 'user@example.com'), // Temporary user email
        '/chat': (context) => ChatWindow(), // Route for ChatWindow
      },
    );
  }
}