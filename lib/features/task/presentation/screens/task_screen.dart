import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';
import 'package:real_estate_admin/features/task/presentation/screens/calendar/calendar_toggle.dart';
import 'package:real_estate_admin/features/task/presentation/screens/calendar/month_calendar.dart';
import 'package:real_estate_admin/features/task/presentation/screens/calendar/week_calendar.dart';
import 'package:real_estate_admin/core/theme/app_colors.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  CalendarView _view = CalendarView.week;

  DateTime _selectedDay = DateTime.now();
  DateTime _weekReferenceDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final DateTime _headerDay = DateTime.now();

  String get _monthLabel => DateFormat('MMMM, yyyy').format(_headerDay);

  void _onMonthDaySelected(DateTime selectedDay) {
    setState(() {
      if (_rangeStart != null && _rangeEnd != null) {
        _rangeStart = selectedDay;
        _rangeEnd = null;
        _selectedDay = selectedDay;
      } else if (_rangeStart == null ||
          (_rangeStart != null && _rangeEnd != null)) {
        _rangeStart = selectedDay;
        _rangeEnd = null;
        _selectedDay = selectedDay;
      } else if (_rangeStart != null && _rangeEnd == null) {
        if (selectedDay.isBefore(_rangeStart!)) {
          _rangeStart = selectedDay;
          _selectedDay = selectedDay;
        } else {
          _rangeEnd = selectedDay;
          _selectedDay = selectedDay;

          if (kDebugMode) {
            final formatter = DateFormat('yyyy-MM-dd');
            debugPrint(
                'Izabran opseg: ${formatter.format(_rangeStart!)} - ${formatter.format(_rangeEnd!)}');
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              brightness: Brightness.light,
              surface: Colors.white,
              onSurface: Colors.black,
              primary: AppColors.bgButton,
              onPrimary: Colors.white,
            ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
        chipTheme: Theme.of(context).chipTheme.copyWith(
              backgroundColor: Colors.transparent,
              selectedColor: AppColors.bgButton,
              labelStyle: const TextStyle(color: Colors.white),
            ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDay,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: AppColors.bgButton,
                                  onPrimary: Colors.white,
                                  onSurface: Colors.black,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if (picked != null) {
                          setState(() {
                            _selectedDay = picked;
                            _weekReferenceDay = picked;
                            _rangeStart = picked;
                            _rangeEnd = null;
                          });

                          if (kDebugMode) {
                            final formatter = DateFormat('yyyy-MM-dd');
                            debugPrint(
                                'Izabran datum za week label: ${formatter.format(picked)}');
                          }
                        }
                      },
                      child: Text(
                        _monthLabel,
                        style: AppTextStyles.titleText(context).copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Spacer(),
                    CalendarToggle(
                      currentView: _view,
                      onViewChanged: (v) => setState(() {
                        _view = v;
                        final now = DateTime.now();
                        _selectedDay = now;
                        _weekReferenceDay = now;
                        _rangeStart = null;
                        _rangeEnd = null;
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _view == CalendarView.week
                    ? WeekCalendar(
                        selectedDay: _weekReferenceDay,
                        onDayTap: (d) {
                          setState(() {
                            _weekReferenceDay = d;
                            _rangeStart = null;
                            _rangeEnd = null;
                          });
                        },
                        onWeekChanged: (newDay) {
                          setState(() {
                            _weekReferenceDay = newDay;
                            _selectedDay = _weekReferenceDay;
                            if (kDebugMode) {
                              print(_selectedDay);
                            }
                          });
                        },
                      )
                    : MonthCalendar(
                        focusedDay: _selectedDay,
                        rangeStart: _rangeStart,
                        rangeEnd: _rangeEnd,
                        onDaySelected: _onMonthDaySelected,
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.bgButton,
          onPressed: () {
            /* plus dugme */
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
