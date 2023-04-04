import 'package:flutter/material.dart';

/// home page for all users.
/// allows users to:
/// 1. order a service
/// 2. track ongoing orders (bookings)
/// 3. view profile
/// 4. notifications
/// 5. help
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home page'),
      ),
    );
  }
}
