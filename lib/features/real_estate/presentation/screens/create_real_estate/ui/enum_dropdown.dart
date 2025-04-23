import 'package:flutter/material.dart';

enum SelectionMode { single, multiple }

class EnumDropdown<T extends Enum> extends StatefulWidget {
  final List<T> items;
  final SelectionMode selectionMode;
  final String Function(T, BuildContext) getLabel;
  final IconData Function(T) getIcon;
  final String Function(BuildContext) getTitle;
  final void Function(dynamic selected) onSelectionChanged;

  const EnumDropdown({
    super.key,
    required this.items,
    required this.selectionMode,
    required this.getLabel,
    required this.getIcon,
    required this.getTitle,
    required this.onSelectionChanged,
  });

  @override
  State<EnumDropdown<T>> createState() => _EnumDropdownState<T>();
}

class _EnumDropdownState<T extends Enum> extends State<EnumDropdown<T>> {
  bool isExpanded = false;
  T? selected;
  Set<T> selectedItems = {};

  void toggleExpanded() {
    setState(() => isExpanded = !isExpanded);
  }

  void _selectItem(T item) {
    if (widget.selectionMode == SelectionMode.single) {
      setState(() {
        selected = item;
        isExpanded = false;
      });
      widget.onSelectionChanged(item);
    } else {
      setState(() {
        if (selectedItems.contains(item)) {
          selectedItems.remove(item);
        } else {
          selectedItems.add(item);
        }
      });
      widget.onSelectionChanged(selectedItems.toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    final count = selectedItems.length;

    return Column(
      children: [
        GestureDetector(
          onTap: toggleExpanded,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      widget.selectionMode == SelectionMode.single
                          ? widget.getIcon(
                          selected ?? widget.items.first)
                          : Icons.filter_list,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.selectionMode == SelectionMode.single
                          ? selected != null
                          ? widget.getLabel(selected!, context)
                          : widget.getTitle(context)
                          : widget.getTitle(context),
                      style: const TextStyle(fontSize: 16),
                    ),
                    if (widget.selectionMode == SelectionMode.multiple &&
                        count > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(Icons.circle,
                                color: Colors.red, size: 20),
                            Text(
                              '$count',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isExpanded
              ? AnimatedContainer(
            key: const ValueKey(true),
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: widget.items.map((item) {
                final isSelected =
                widget.selectionMode == SelectionMode.single
                    ? selected == item
                    : selectedItems.contains(item);

                return ListTile(
                  leading: Icon(widget.getIcon(item),
                      color: isSelected ? Colors.red : Colors.grey),
                  title: Text(
                    widget.getLabel(item, context),
                    style: TextStyle(
                      color:
                      isSelected ? Colors.red : Colors.black,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  trailing: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                        isSelected ? Colors.red : Colors.grey,
                        width: 2,
                      ),
                      color: isSelected
                          ? Colors.red
                          : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check,
                        color: Colors.white, size: 14)
                        : null,
                  ),
                  onTap: () => _selectItem(item),
                );
              }).toList(),
            ),
          )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
