// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodigy/controller/update_values_controller.dart';
import 'package:foodigy/presentation/home_screens/home.dart';
import 'package:foodigy/utilities/const_color.dart';
import 'package:foodigy/utilities/const_value.dart';
import 'package:foodigy/widgets/foodigy_button.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

final kToday = DateTime.now();
DateTime kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month , kToday.day+10);

class CalendarTable extends StatefulWidget {
  const CalendarTable({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarTableState createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  MainScreenController mainController = Get.put(MainScreenController());
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.6,
      width: double.infinity,
      child: Column(
        children: [
          TableCalendar(
            // availableCalendarFormats:{CalendarFormat.twoWeeks:'Month',} ,
            firstDay: DateTime.now(),
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            weekendDays: const [
              DateTime.saturday,
            ],
            daysOfWeekStyle:
                DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.red)),
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            calendarStyle: CalendarStyle(
                //   rangeHighlightColor: Colors.black,
                canMarkersOverflow: false,
                isTodayHighlighted: false,
                markerDecoration: BoxDecoration(color: Colors.amber),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstColor,
                ),
                todayDecoration: BoxDecoration(color: Colors.red),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                  //backgroundColor: Colors.red
                )),

            calendarFormat: _calendarFormat,
            headerVisible: true,
            daysOfWeekVisible: true,
            pageJumpingEnabled: false,
            pageAnimationEnabled: true,
            sixWeekMonthsEnforced: false,
            shouldFillViewport: false,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  focused =focusedDay;
                  passDate = _selectedDay.toString();
                  // print("focus");
                  // print(
                  //     '${_selectedDay!.month},${_selectedDay!.day},${_selectedDay!.year}');
                  // print(_selectedDay);
                  selectDate ="${_selectedDay!.month}/${_selectedDay!.day}/${_selectedDay!.year}";
                  selectDisaplayDate="${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}";
                  // print('seleceted date');
                  // print(selectDate);
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
               focusedDay =focusedDay;
              _focusedDay = focusedDay;
            },
            // Enable week numbers (disabled by default).
            // weekNumbersVisible: true,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: FoodigyButton(
                        color: Colors.white,
                        textColor: Colors.black,
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.8,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: FoodigyButton(
                      color: firstColor,
                      text: 'Done',
                      onPressed: () {
                        //  print('helo');
                        Get.offAll(Home());
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
