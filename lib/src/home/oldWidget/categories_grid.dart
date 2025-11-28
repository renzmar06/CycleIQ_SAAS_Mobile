import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 16),

        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          childAspectRatio: .9,
          children: [
            _category(context, "Plastic", Icons.local_drink),
            _category(context, "E-Waste", Icons.electrical_services),
            _category(context, "Organic", Icons.eco_rounded),
            _category(context, "Paper", Icons.description),
            _category(context, "Metal", Icons.build_circle_rounded),
            _category(context, "Glass", Icons.wine_bar_rounded),
          ],
        ),
      ],
    );
  }

  Widget _category(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () => AppNav.push(context, "/category/$title"),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.green, size: 28),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
