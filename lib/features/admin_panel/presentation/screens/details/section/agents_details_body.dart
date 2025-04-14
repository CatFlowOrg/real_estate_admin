import 'package:flutter/material.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_details_grid_view.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_details_list_view.dart';
import 'package:material_symbols_icons/symbols.dart';

class AgentDetailsBody extends StatefulWidget {
  final List<AgentModel> agents;

  const AgentDetailsBody({super.key, required this.agents});

  @override
  State<AgentDetailsBody> createState() => _AgentDetailsBodyState();
}

class _AgentDetailsBodyState extends State<AgentDetailsBody> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Symbols.view_list,
                fill: isListView ? 1 : 0,
                weight: 700,
                color: isListView ? Colors.black : Colors.grey,
              ),
              onPressed: () {
                setState(() => isListView = true);
              },
            ),
            IconButton(
              icon: Icon(
                Symbols.grid_view,
                fill: !isListView ? 1 : 0,
                weight: 700,
                color: !isListView ? Colors.black : Colors.grey,
              ),
              onPressed: () {
                setState(() => isListView = false);
              },
            ),
          ],
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isListView
              ? AgentDetailsListView(agents: widget.agents)
              : AgentDetailsGridView(agents: widget.agents),
        ),
      ],
    );
  }
}