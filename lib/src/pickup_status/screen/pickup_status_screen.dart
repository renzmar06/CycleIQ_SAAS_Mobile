import 'package:flutter/material.dart';

class PickupStatusScreen extends StatelessWidget {
  const PickupStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pickup Status"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Latest Pickup",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                Text("Pickup ID: #89345"),
                Text("Status: Completed"),
                Text("Waste Type: Plastic - 5kg"),
                Text("Collected on: Jan 22, 2025"),
                SizedBox(height: 20),

                Text(
                  "Next Scheduled Pickup:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                Text("Monday, 10:00 AM"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
