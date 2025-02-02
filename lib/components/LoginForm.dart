import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome for Google icon

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailOrUsernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    final emailOrUsername = emailOrUsernameController.text;
    Navigator.pushReplacementNamed(
      context,
      '/dashboard',
      arguments: {'userEmail': emailOrUsername},
    );
  }

  void handleGoogleSignIn() async {
    try {
      // Replace with your Firebase Google sign-in logic
      final userEmail = 'Joseph'; // Mock email for demonstration
      Navigator.pushReplacementNamed(
        context,
        '/dashboard',
        arguments: {'userEmail': userEmail},
      );
    } catch (error) {
      print("Google Sign-In failed: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final backgroundColor = Colors.blue;
    final textColor = Colors.black;
    final cardBackgroundColor = Colors.white;
    final inputBorderColor = isLightMode ? Colors.grey : Colors.blue;
    final buttonColor = isLightMode ? Colors.blue : Colors.grey[700];

    return Scaffold(
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Hello!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 40.0),
                Card(
                  color: cardBackgroundColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Student Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: textColor),
                        ),
                        const SizedBox(height: 24.0),
                        // Email/Username Field
                        TextFormField(
                          controller: emailOrUsernameController,
                          decoration: InputDecoration(
                            labelText: "Email/Username",
                            labelStyle: TextStyle(color: textColor),
                            prefixIcon: Icon(Icons.person, color: inputBorderColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: inputBorderColor),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          style: TextStyle(color: textColor),
                        ),
                        const SizedBox(height: 16.0),
                        // Password Field
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: textColor),
                            prefixIcon: Icon(Icons.lock, color: inputBorderColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: inputBorderColor),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          obscureText: true,
                          style: TextStyle(color: textColor),
                        ),
                        const SizedBox(height: 8.0),
                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: buttonColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Login Button
                        ElevatedButton(
                          onPressed: handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "or",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor),
                        ),
                        const SizedBox(height: 16.0),
                        // Google Sign-In Button
                        OutlinedButton.icon(
                          onPressed: handleGoogleSignIn,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FaIcon(FontAwesomeIcons.google, color: inputBorderColor),
                          ),
                          label: Text(
                            "Sign in with Google",
                            style: TextStyle(color: textColor, fontSize: 16.0),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: inputBorderColor),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}