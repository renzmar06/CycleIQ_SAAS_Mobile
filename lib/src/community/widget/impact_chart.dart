import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CommunityImpactChart extends StatefulWidget {
  const CommunityImpactChart({super.key});

  @override
  State<CommunityImpactChart> createState() => _CommunityImpactChartState();
}

class _CommunityImpactChartState extends State<CommunityImpactChart> {
  String selectedRange = "30 Days";

  // Fake dataset. Replace with your real backend values later.
  final Map<String, List<double>> chartData = {
    "7 Days": [8, 7, 6, 9, 5, 6, 4],
    "30 Days": [8, 10, 6, 12, 9, 14, 5],
    "90 Days": [12, 14, 10, 9, 11, 13, 8],
    "1 Year": [20, 18, 24, 22, 19, 23, 21],
  };

  @override
  Widget build(BuildContext context) {
    final data = chartData[selectedRange]!;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Impact Over Time",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),

          /// ---------------- FILTER BUTTONS ----------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _filterButton("7 Days"),
              _filterButton("30 Days"),
              _filterButton("90 Days"),
              _filterButton("1 Year"),
            ],
          ),

          const SizedBox(height: 20),

          /// ---------------- IMPACT CHART ----------------
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(),
                  leftTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final days = [
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat",
                          "Sun",
                        ];
                        return Text(
                          days[value.toInt()],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: List.generate(data.length, (i) => _bar(i, data[i])),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ---------------- FILTER BUTTON BUILDER ----------------
  Widget _filterButton(String label) {
    final bool active = selectedRange == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRange = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.green : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  /// ---------------- BAR BUILDER ----------------
  BarChartGroupData _bar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.green,
          width: 22,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }
}
