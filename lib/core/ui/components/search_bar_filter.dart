import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SearchBarFilter extends StatefulWidget {
  final void Function()? onFilterTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchBarFilter({
    super.key,
    this.onFilterTap,
    this.controller,
    this.onChanged,
    this.hintText = 'Search...',
  });

  @override
  State<SearchBarFilter> createState() => _SearchBarFilterState();
}

class _SearchBarFilterState extends State<SearchBarFilter> {
  late final TextEditingController _internalController;
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();

    _internalController.addListener(() {
      setState(() {
        _showClear = _internalController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  void _clearText() {
    _internalController.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _internalController,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                    fontSize: 18
                ),

                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _showClear
                    ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _clearText,
                )
                    : null,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

          ),
          GestureDetector(
            onTap: widget.onFilterTap,
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Symbols.page_info),
            ),
          ),
        ],
      ),
    );
  }
}
