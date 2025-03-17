import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:satoshi_app/dashboard/business/dashboard_view_model.dart';
import 'package:provider/provider.dart';


class InvestmentGraphView extends StatelessWidget {
InvestmentGraphView({super.key});

final List<FlSpot> dataPoints = [
    FlSpot(0, 50000), // Example: (Day 0, $50,000)
    FlSpot(1, 50500),
    FlSpot(2, 51000),
    FlSpot(3, 49000),
    FlSpot(4, 52000),
    FlSpot(5, 53000), // Day 5, $53,000
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: Colors.orange,
              barWidth: 3,
              belowBarData: BarAreaData(show: true, color: Colors.orange.withOpacity(0.3))
            )
          ]
        )
        )
    );
}
}