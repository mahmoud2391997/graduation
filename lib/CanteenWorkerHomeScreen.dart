import 'package:flutter/material.dart';

class CanteenWorkerHomeScreen extends StatefulWidget {
  const CanteenWorkerHomeScreen({super.key});

  @override
  State<CanteenWorkerHomeScreen> createState() =>
      _CanteenWorkerHomeScreenState();
}

class _CanteenWorkerHomeScreenState extends State<CanteenWorkerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("home")),
    );
  }
}
