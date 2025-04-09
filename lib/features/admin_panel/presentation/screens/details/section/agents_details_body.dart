import 'package:flutter/material.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_details_grid_view.dart';
import 'package:real_estate_admin/features/admin_panel/presentation/screens/details/section/agents_details_list_view.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:material_symbols_icons/symbols.dart';



class AgentDetailsBody extends StatefulWidget {
  final List<AgentModel> agents;

  const AgentDetailsBody({super.key, required this.agents});

  @override
  State<AgentDetailsBody> createState() => _AgentDetailsBodyState();
}

class _AgentDetailsBodyState extends State<AgentDetailsBody> {
  bool isListView = true;
  late List<AgentModel> _visibleAgents;

  @override
  void initState() {
    super.initState();

    _visibleAgents = widget.agents.take(5).toList();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _visibleAgents = widget.agents;
        });
      }
    });
  }

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
                fill: isListView? 1 : 0,
                weight: 700,
                grade: 0,
                opticalSize: 24,
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
                  grade: 0,
                  opticalSize: 24,
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
              ? AgentDetailsListView(agents: _visibleAgents)
              : AgentDetailsGridView(agents: _visibleAgents),
        ),
      ],
    );
  }
}