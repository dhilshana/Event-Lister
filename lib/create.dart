import 'package:eventlister/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final user = FirebaseAuth.instance.currentUser;

  // Method to handle sign out
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home', // Use the route name for your homepage
      (route) => false, // Remove all routes from the stack
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check if user is not null before accessing email
    final userEmail = user?.email ?? "No user";

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed in as: $userEmail"),
            SizedBox(height: 20),
            TextButton(
              onPressed: signOut,
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
