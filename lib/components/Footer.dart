import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      color: Color(0xFF42A5F5), // Background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white, size: 30.0),
            onPressed: () {
              // Navigate to Home
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white, size: 30.0),
            onPressed: () {
              // Navigate to Profile
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white, size: 30.0),
            onPressed: () {
              // Navigate to Settings
            },
          ),
          IconButton(
            icon: Icon(Icons.help, color: Colors.white, size: 30.0),
            onPressed: () {
              // Navigate to Help
            },
          ),
        ],
      ),
    );
  }
}