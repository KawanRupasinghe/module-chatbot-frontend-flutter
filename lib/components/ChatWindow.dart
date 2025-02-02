import 'package:flutter/material.dart';
import 'footer.dart'; // Import the Footer widget

class ChatWindow extends StatefulWidget {
  @override
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> chatHistory = [];

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        chatHistory.add({'sender': 'user', 'message': message});
        chatHistory.add({'sender': 'bot', 'message': 'You sent: $message'});
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final moduleName = args['moduleName']!;
    final userEmail = args['userEmail']!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(moduleName, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF42A5F5), // Set background color
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(userEmail, style: const TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final chat = chatHistory[index];
                return Align(
                  alignment: chat['sender'] == 'user' ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: chat['sender'] == 'user' ? Colors.blue : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      chat['message']!,
                      style: TextStyle(
                        color: chat['sender'] == 'user' ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () => sendMessage(_messageController.text),
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
          Footer(), // Add Footer at the bottom
        ],
      ),
    );
  }
}