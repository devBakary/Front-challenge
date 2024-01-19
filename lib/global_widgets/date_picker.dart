import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  DatePickerWidget({required this.onDateSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });
          widget.onDateSelected(pickedDate);
        }
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10.0),
        decoration: const BoxDecoration(
          color: Color(0xFFe7edeb),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: Colors.black.withOpacity(0.8),
            ),
            const SizedBox(
              width: 20,
            ),
            selectedDate != null
                ? Text(
                    DateFormat('yyyy-MM-dd').format(selectedDate!).toString(),
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  )
                : Text(
                    'Date de naissance',
                    // style: TextStyle(color: labelColor),
                  ),
          ],
        ),
      ),
    );
  }
}
