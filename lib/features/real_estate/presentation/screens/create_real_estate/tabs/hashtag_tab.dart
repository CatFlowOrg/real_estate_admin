import 'package:flutter/material.dart';

class HashtagTab extends StatefulWidget {
  const HashtagTab({super.key});

  @override
  State<HashtagTab> createState() => _HashtagTabState();
}

class _HashtagTabState extends State<HashtagTab> {
  // ✅ Checkbox stanja
  bool fromNode = false;
  bool featured = false;

  final Map<String, bool> otherTags = {
    "Ekskluzivna lokacija": false,
    "Prilika mjeseca": false,
    "Prilika tjedna": false,
    "Vila": false,
    "Na rijeci": false,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Hashtagovi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          const SizedBox(height: 24),

          // ✅ Glavni checkboxovi
          CheckboxListTile(
            title: const Text("Izdvojeno iz Node-a"),
            value: fromNode,
            onChanged: (val) => setState(() => fromNode = val ?? false),
          ),
          CheckboxListTile(
            title: const Text("Naslovnica"),
            value: featured,
            onChanged: (val) => setState(() => featured = val ?? false),
          ),

          const SizedBox(height: 24),

          const Text("Ostali hashtagovi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),

          const SizedBox(height: 8),

          // ✅ Ostali hashtagovi
          ...otherTags.entries.map(
                (entry) => CheckboxListTile(
              title: Text(entry.key),
              value: entry.value,
              onChanged: (val) {
                setState(() {
                  otherTags[entry.key] = val ?? false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
