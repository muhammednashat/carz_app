import 'package:carz_app/data/models/time_model.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        itemCount: times.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ItemTime(time: times[index]);
        },
      ),
    );
  }
}

class ItemTime extends StatelessWidget {
  const ItemTime({super.key, required this.time});
  final TimeModel time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(time.timeText, textAlign: TextAlign.center)),

        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}