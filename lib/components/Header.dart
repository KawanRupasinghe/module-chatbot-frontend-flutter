import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String userEmail;
  final VoidCallback onLogout;
  final VoidCallback toggleTheme;
  final bool isLightMode;

  Header({
    required this.userEmail,
    required this.onLogout,
    required this.toggleTheme,
    required this.isLightMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLightMode ? Color(0xFF42A5F5) : Colors.black87, // Adjust background color
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 1)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40), // Add space to avoid overlapping with status bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // App Title
              Text(
                'Chatbot Application',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isLightMode ? Colors.white : Colors.white70,
                ),
              ),
              Row(
                children: [
                  // Dark Mode Toggle
                  IconButton(
                    icon: Icon(
                      isLightMode ? Icons.nightlight_round : Icons.wb_sunny,
                      color: isLightMode ? Colors.black : Colors.white,
                    ),
                    onPressed: toggleTheme,
                  ),
                  // User Profile Popover
                  GestureDetector(
                    onTap: () {
                      _showProfile(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(userEmail),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Email: $userEmail'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: onLogout,
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,  // Replacing 'primary' with 'backgroundColor'
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}