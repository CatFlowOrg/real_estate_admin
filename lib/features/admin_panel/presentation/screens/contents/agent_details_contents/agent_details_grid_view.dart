import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/agent_model.dart';

class AgentDetailsGridView extends StatelessWidget {
  final List<AgentModel> agents;

  const AgentDetailsGridView({super.key, required this.agents});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: agents.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 3 / 3.5,
      ),
      itemBuilder: (context, index) {
        final agent = agents[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28,
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

              const SizedBox(height: 8),
              Text(
                "${agent.firstName} ${agent.lastName}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                agent.role ?? "-",
                style: const TextStyle(color: Colors.black54, fontSize: 12),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
