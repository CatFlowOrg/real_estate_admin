import 'package:flutter/material.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';

class AgentDetailsListView extends StatelessWidget {
  final List<AgentModel> agents;

  const AgentDetailsListView({super.key, required this.agents});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: agents.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, color: Colors.black12),
      itemBuilder: (context, index) {
        final agent = agents[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[300],
            child: ClipOval(
              child: agent.imageUrl != null && agent.imageUrl!.isNotEmpty
                  ? Image.network(
                      agent.imageUrl!,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person, color: Colors.white),
                    )
                  : const Icon(Icons.person, color: Colors.white),
            ),
          ),
          title: Text(
            "${agent.firstName} ${agent.lastName}",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
          ),
          subtitle: Text(
            agent.role ?? "-",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                agent.officeName,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black45,
                    ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.location_pin, size: 16, color: Colors.black26),
            ],
          ),
        );
      },
    );
  }
}
