import 'package:flutter/material.dart';

class RecyclingCentersScreen extends StatelessWidget {
  const RecyclingCentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final centers = [
      {"name": "Eco Recycle Center", "distance": "2.3 km"},
      {"name": "Green Earth Facility", "distance": "4.8 km"},
      {"name": "Urban Waste Solutions", "distance": "6.0 km"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recycling Centers"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: centers.length,
        itemBuilder: (_, i) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.location_on, color: Colors.green),
              title: Text(centers[i]["name"]!),
              subtitle: Text("Distance: ${centers[i]["distance"]}"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
