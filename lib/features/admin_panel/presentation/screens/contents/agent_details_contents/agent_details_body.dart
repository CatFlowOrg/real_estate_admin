import 'package:flutter/material.dart';
import '../../../../data/models/agent_model.dart';
import 'agent_details_list_view.dart';
import 'agent_details_grid_view.dart';

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
              icon: Icon(Icons.list, color: isListView ? Colors.black : Colors.grey),
              onPressed: () {
                setState(() => isListView = true);
              },
            ),
            IconButton(
              icon: Icon(Icons.grid_view, color: !isListView ? Colors.black : Colors.grey),
              onPressed: () {
                setState(() => isListView = false);
              },
            ),
          ],
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Expanded(
            child: isListView
                ? AgentDetailsListView(agents: _visibleAgents)
                : AgentDetailsGridView(agents: _visibleAgents),
          ),
        ),

      ],
    );
  }
}

