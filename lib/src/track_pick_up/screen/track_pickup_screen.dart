import 'package:flutter/material.dart';

class TrackPickupScreen extends StatelessWidget {
  const TrackPickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Pickup"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(Icons.map, size: 120, color: Colors.grey),
            ),
          ),

          const SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: const Icon(Icons.directions_bike, color: Colors.green),
            ),
            title: const Text("Pickup Agent on the way"),
            subtitle: const Text("Will arrive in 15–20 minutes"),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: LinearProgressIndicator(
              value: 0.65,
              color: Colors.green,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
