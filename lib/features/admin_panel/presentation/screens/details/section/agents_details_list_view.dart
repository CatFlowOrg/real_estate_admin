import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/agent_model.dart';

class AgentDetailsListView extends StatelessWidget {
  final List<AgentModel> agents;

  const AgentDetailsListView({super.key, required this.agents});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: agents.length,
      separatorBuilder: (_, __) => const Divider(height: 1, color: Colors.black12),
      itemBuilder: (context, index) {
        final agent = agents[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[300],
            child: ClipOval(
              child: agent.imageUrl != null && agent.imageUrl!.isNotEmpty
                  ? CachedNetworkImage(
                imageUrl: agent.imageUrl!,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 100),
                placeholder: (context, url) => const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.person, color: Colors.white),
                useOldImageOnUrlChange: true,
                cacheKey: agent.imageUrl,
              )

                  : const Icon(Icons.person, color: Colors.white),
            ),
          ),
          title: Text(
            "${agent.firstName} ${agent.lastName}",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          subtitle: Text(agent.role ?? "-"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                agent.officeName,
                style: const TextStyle(color: Colors.black45),
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