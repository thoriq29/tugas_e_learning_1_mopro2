import 'package:flutter/material.dart';
import 'package:moh_torikul_a_tugas_elearning_1/presentation/provider/assignment_provider.dart';
import 'package:provider/provider.dart';

class AppWidget {
  static Future showDateTimePicker(context) async {
    DateTime? selectedDate;
    selectedDate = await showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 75 / 100,
                  height: MediaQuery.of(context).size.height * 75 / 100,
                  constraints: const BoxConstraints(
                    minWidth: 360,
                    minHeight: 560,
                  ),
                  child: DatePickerDialog(
                    initialDate: DateTime.now(),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    firstDate: DateTime(2021),
                    lastDate: DateTime.now().add(const Duration(days: 3600)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    if(selectedDate != null) {
      Provider.of<AssignmentProvider>(context, listen: false).deadlineDate = selectedDate;
    }
  }

  static Future showTimePicker(context) async {
    TimeOfDay? selectedTime;
    selectedTime = await showDialog<TimeOfDay>(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 75 / 100,
                  height: MediaQuery.of(context).size.height * 75 / 100,
                  constraints: const BoxConstraints(
                    minWidth: 360,
                    minHeight: 560,
                  ),
                  child: TimePickerDialog(
                    initialTime: TimeOfDay.now(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    if(selectedTime != null) {
      Provider.of<AssignmentProvider>(context, listen: false).deadlineTime = selectedTime;
    }
  }
}