import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:real_estate_admin/core/theme/app_colors.dart';

class MonthCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final ValueChanged<DateTime> onDaySelected;

  const MonthCalendar({
    super.key,
    required this.focusedDay,
    required this.rangeStart,
    required this.rangeEnd,
    required this.onDaySelected,
  });

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      rowHeight: 48,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) => _isSameDay(day, focusedDay),
      rangeStartDay: rangeStart,
      rangeEndDay: rangeEnd,
      rangeSelectionMode: RangeSelectionMode.toggledOff,
      onDaySelected: (day, _) => onDaySelected(day),
      onRangeSelected: (_, __, ___) {}, // disable default range handling

      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
      ),

      calendarStyle: const CalendarStyle(
        rangeHighlightColor: Colors.transparent,
        todayDecoration: BoxDecoration(),
        todayTextStyle: TextStyle(),
      ),

      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        weekendStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),

      calendarBuilders: CalendarBuilders(
        withinRangeBuilder: (context, day, _) {
          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(76, 175, 80, 0.25),
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          );
        },
        rangeStartBuilder: (context, day, _) {
          return Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.bgButton,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${day.day}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        rangeEndBuilder: (context, day, _) {
          return Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.bgButton,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${day.day}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        selectedBuilder: (context, day, _) {
          return Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.bgButton,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${day.day}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
