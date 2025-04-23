import 'package:flutter/material.dart';
import 'package:real_estate_admin/core/theme/app_colors.dart';

enum CalendarView { week, month }

class CalendarToggle extends StatelessWidget {
  final CalendarView currentView;
  final ValueChanged<CalendarView> onViewChanged;

  const CalendarToggle({
    super.key,
    required this.currentView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChoiceChip(
          label: const Text('Week'),
          selected: currentView == CalendarView.week,
          onSelected: (_) => onViewChanged(CalendarView.week),
          // styling
          backgroundColor: Colors.white,
          selectedColor: AppColors.bgButton,
          labelStyle: TextStyle(
            color: currentView == CalendarView.week
                ? Colors.white
                : AppColors.primary,
          ),
          shape: const StadiumBorder(
            side: BorderSide(color: AppColors.bgButton),
          ),
        ),
        const SizedBox(width: 8),
        ChoiceChip(
          label: const Text('Month'),
          selected: currentView == CalendarView.month,
          onSelected: (_) => onViewChanged(CalendarView.month),
          backgroundColor: Colors.white,
          selectedColor: AppColors.bgButton,
          labelStyle: TextStyle(
            color: currentView == CalendarView.month
                ? Colors.white
                : AppColors.primary,
          ),
          shape: const StadiumBorder(
            side: BorderSide(color: AppColors.bgButton),
          ),
        ),
      ],
    );
  }
}
