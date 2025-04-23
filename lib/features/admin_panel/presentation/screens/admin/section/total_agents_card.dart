import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TotalAgentsCard extends StatefulWidget {
  final int totalAgents;
  final List<AgentModel> agents;
  final bool isExpanded;
  final VoidCallback onToggleExpanded;

  const TotalAgentsCard({
    super.key,
    required this.totalAgents,
    required this.agents,
    required this.isExpanded,
    required this.onToggleExpanded,
  });

  @override
  State<TotalAgentsCard> createState() => _TotalAgentsCardState();
}

class _TotalAgentsCardState extends State<TotalAgentsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.isExpanded) {
        _controller.forward();
      }
    });
  }

  @override
  void didUpdateWidget(TotalAgentsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToDetails() {
    context.push('/details');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToDetails,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
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
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.total_agents,
                    style: AppTextStyles.nameText(context),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                InkWell(
                  onTap: widget.onToggleExpanded,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      widget.isExpanded
                          ? Symbols.close_fullscreen
                          : Symbols.open_in_full,
                      size: 20,
                      weight: 300,
                      fill: 0,
                      color: Colors.black45,
                    ),
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
                    "${widget.totalAgents}",
                    style: AppTextStyles.widgetText(context),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
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
                      Text(
                        "Last month, 23",   // dodaj lokalizaciju kasnije kada budu pravi podaci
                        style: AppTextStyles.roleText(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}