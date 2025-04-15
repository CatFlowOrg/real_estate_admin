import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/features/admin_panel/data/models/agent_model.dart';

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
            boxShadow: const [
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
              const SizedBox(height: 8),
              Text(
                "${agent.firstName} ${agent.lastName}",
                style: AppTextStyles.listText(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                agent.role ?? "-",
                style: AppTextStyles.roleText(context),
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
