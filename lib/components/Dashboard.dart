import 'package:flutter/material.dart';
import 'footer.dart'; // Import the Footer widget
import 'header.dart'; // Import the Header widget

class Dashboard extends StatefulWidget {
  final String userEmail; // Pass user email from LoginForm

  const Dashboard({required this.userEmail});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLightMode = true;

  void toggleTheme() {
    setState(() {
      isLightMode = !isLightMode;
    });
  }

  void onLogout() {
    Navigator.pop(context); // Navigate back to LoginForm on logout
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> modules = [
      {'name': 'Object Oriented Analysis and Design', 'image': 'assets/images/ooad.jpg', 'moduleId': 'module1', 'color': '0xFF42A5F5'},
      {'name': 'Design and Analysis of Algorithms', 'image': 'assets/images/daa.jpg', 'moduleId': 'module2', 'color': '0xFF66BB6A'},
      {'name': 'Probability and Statistics', 'image': 'assets/images/ps.avif', 'moduleId': 'module3', 'color': '0xFFFF7043'},
      {'name': 'Computer Networks', 'image': 'assets/images/cn.jpg', 'moduleId': 'module4', 'color': '0xFFAB47BC'},
      {'name': 'Database Management', 'image': 'assets/images/dms.jpg', 'moduleId': 'module5', 'color': '0xFFFFCA28'},
    ];

    void navigateToChat(String moduleId, String moduleName) {
      Navigator.pushNamed(
        context,
        '/chat',
        arguments: {
          'moduleName': moduleName,
          'userEmail': widget.userEmail, // Pass user email to ChatWindow
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Header(
            userEmail: widget.userEmail,
            onLogout: onLogout,
            toggleTheme: toggleTheme,
            isLightMode: isLightMode,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back,',
                          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          widget.userEmail,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(height: 16.0),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Slightly round borders
                          ),
                          elevation: 4.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), // Slightly round borders
                            child: Container(
                              color: isLightMode ? Colors.blue[100] : Colors.blueGrey[700], // Background color based on theme
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Select the module you want and ask questions via chat.',
                                style: TextStyle(fontSize: 20, color: isLightMode ? Colors.black : Colors.white), // Text color based on theme
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Modules',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: isLightMode ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final module = modules[index];
                        return GestureDetector(
                          onTap: () => navigateToChat(module['moduleId']!, module['name']!),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0), // Make the card round
                            child: Card(
                              color: Color(int.parse(module['color']!)),
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0), // Make the card round
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
                                    child: Image.asset(
                                      module['image']!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 150.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    child: Text(
                                      module['name']!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: modules.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 24.0), // Add extra space at the bottom
                ),
              ],
            ),
          ),
          Footer(), // Place Footer outside Expanded to keep it fixed
        ],
      ),
    );
  }
}