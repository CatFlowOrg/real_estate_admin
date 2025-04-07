import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/agent_model.dart';

class TotalAgentsCard extends StatelessWidget {
  final int totalAgents;
  final List<AgentModel> agents;


  const TotalAgentsCard({super.key, required this.totalAgents, required this.agents});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.open_in_full_rounded, size: 18, color: Colors.black38),
                onPressed: () {
                  context.push('/details');
                },
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
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                            color: Colors.green,
                            barWidth: 2,
                          ),
                        ],
                        titlesData: FlTitlesData(show: false),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        lineTouchData: LineTouchData(enabled: false),
                        minX: 0,
                        maxX: 2,
                        minY: 20,
                        maxY: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text("Last month, 23", style: TextStyle(fontSize: 12, color: Colors.black38)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
