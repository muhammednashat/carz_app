import 'dart:ffi';

import 'package:carz_app/config/dependecy/dependeces.dart';
import 'package:carz_app/data/models/time_model.dart';
import 'package:carz_app/ui/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final times = [
    TimeModel(timeText: '07:00 AM'),
    TimeModel(timeText: '09:00 AM'),
    TimeModel(timeText: '11:00 AM'),
    TimeModel(timeText: '12:00 PM'),
    TimeModel(timeText: '01:00 PM'),
    TimeModel(timeText: '03:00 PM'),
  ];

  int selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        itemCount: times.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = selectedItem == index;
          return ItemTime(
            time: times[index],
            isSelected: isSelected,
            index: index,
            onTap: _onItemTapped,
          );
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedItem = index;
    });
  }
}

class ItemTime extends ConsumerStatefulWidget {
  const ItemTime({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTap,
    required this.index,
  });
  final TimeModel time;
  final bool isSelected;
  final void Function(int) onTap;
  final int index;

  @override
  ConsumerState<ItemTime> createState() => _ItemTimeState();
}

class _ItemTimeState extends ConsumerState<ItemTime> {
  _onTapped() {
    ref.read(bookingModelProvider.notifier).setTime(widget.time.timeText);
    widget.onTap(widget.index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        (widget.isSelected) ? AppTheme.accent : Colors.amberAccent;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: _onTapped,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(widget.time.timeText, textAlign: TextAlign.center),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
