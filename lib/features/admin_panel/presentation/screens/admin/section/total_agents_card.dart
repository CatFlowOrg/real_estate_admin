import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';

import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';


class TotalAgentsCard extends StatelessWidget {
  final int totalAgents;
  final List<AgentModel> agents;

  const TotalAgentsCard({
    super.key,
    required this.totalAgents,
    required this.agents,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/details'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Agents",
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: null,
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 1,
                    ),
                    shadowColor: Colors.transparent,
                  ),
                  icon: const Icon(
                    Symbols.open_in_full,
                    size: 18,
                    weight: 300,
                    fill: 0,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "$totalAgents",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 40,
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(0, 23),
                                FlSpot(1, 26),
                                FlSpot(2, 27),
                              ],
                              isCurved: true,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                              color: Colors.green,
                              barWidth: 2,
                            ),
                          ],
                          titlesData: const FlTitlesData(show: false),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          lineTouchData: const LineTouchData(enabled: false),
                          minX: 0,
                          maxX: 2,
                          minY: 20,
                          maxY: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Last month, 23",
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
