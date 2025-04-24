import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_admin/core/theme/app_colors.dart';

const _weekdayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

class WeekCalendar extends StatelessWidget {
  final DateTime selectedDay;
  final ValueChanged<DateTime> onDayTap;
  final ValueChanged<DateTime> onWeekChanged;

  const WeekCalendar({
    super.key,
    required this.selectedDay,
    required this.onDayTap,
    required this.onWeekChanged,
  });

  @override
  Widget build(BuildContext context) {
    final monday =
    selectedDay.subtract(Duration(days: selectedDay.weekday - 1));
    final days = List.generate(7, (i) => monday.add(Duration(days: i)));
    final weekLabel = DateFormat('MMMM yyyy').format(selectedDay);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Center(
            child: Text(
              weekLabel,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity != null) {
              if (details.primaryVelocity! < 0) {
                // Swipe levo -> sledeća nedelja
                onWeekChanged(selectedDay.add(const Duration(days: 7)));
              } else if (details.primaryVelocity! > 0) {
                // Swipe desno -> prethodna nedelja
                onWeekChanged(selectedDay.subtract(const Duration(days: 7)));
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: days.map((day) {
                final isSelected = selectedDay.year > 1 &&
                    day.year == selectedDay.year &&
                    day.month == selectedDay.month &&
                    day.day == selectedDay.day;

                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.bgButton : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onDayTap(day),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _weekdayLabels[day.weekday - 1],
                            style: TextStyle(
                              color:
                              isSelected ? Colors.white : Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            day.day.toString(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
