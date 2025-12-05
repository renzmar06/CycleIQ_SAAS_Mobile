import 'package:flutter/material.dart';
import '../model/dropoff_location_model.dart';

class DropOffLocationCard extends StatelessWidget {
  final DropOffLocation location;
  final VoidCallback onNavigate;

  const DropOffLocationCard({
    super.key,
    required this.location,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.blue[400], size: 28),
          const SizedBox(width: 12),

          /// TEXTS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location.address,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          /// STATUS + NAVIGATE ICON
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: location.isOpen
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  location.isOpen ? "Open" : "Closed",
                  style: TextStyle(
                    color: location.isOpen ? Colors.green : Colors.red.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: onNavigate,
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xff4aa3ff),
                  child: Icon(Icons.near_me, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
