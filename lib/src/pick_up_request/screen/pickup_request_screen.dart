import 'package:flutter/material.dart';

class PickupRequestScreen extends StatelessWidget {
  const PickupRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Pickup"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Schedule a Waste Pickup",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: "Pickup Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                labelText: "Waste Type (Plastic, Metal, etc.)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                labelText: "Approx Weight (kg)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
                child: const Text("Submit Request"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
