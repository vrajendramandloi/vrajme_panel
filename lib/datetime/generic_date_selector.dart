import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GenericDateSelector extends StatelessWidget {
  final DateTime defaultDate;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final String? label;

  const GenericDateSelector({
    super.key,
    required this.defaultDate,
    this.selectedDate,
    required this.onDateSelected,
    this.label,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? defaultDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime dateToShow = selectedDate ?? defaultDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        InkWell(
          onTap: () => _selectDate(context),
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat.yMMMd().format(dateToShow), // e.g., "Jul 5, 2025"
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Icon(Icons.calendar_today_outlined),
              ],
            ),
          ),
        ),
      ],
    );
  }
}