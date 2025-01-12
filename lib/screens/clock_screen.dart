import 'dart:async';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:digital_clock/widgets/digit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late Timer? timer;
  String hour1 = "0",
      hour2 = "0",
      minute1 = "0",
      minute2 = "0",
      second1 = "0",
      second2 = "0";
  final df = DateFormat('HH:mm:ss');

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final time = DateTime.now();
      final printable = df.format(time);
      final splits = printable.split(":");
      final hour = splits[0];
      final minute = splits[1];
      final second = splits[2];
      setState(() {
        hour1 = hour.characters.first;
        hour2 = hour.characters.last;
        minute1 = minute.characters.first;
        minute2 = minute.characters.last;
        second1 = second.characters.first;
        second2 = second.characters.last;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedFlipCounter(
            //   value: double.parse(second2),
            //   textStyle: TextStyle(
            //     fontSize: 80,
            //     fontWeight: FontWeight.bold,
            //     letterSpacing: -8.0,
            //     color: Colors.yellow,
            //     shadows: [
            //       BoxShadow(
            //         color: Colors.orange,
            //         offset: Offset(8, 8),
            //         blurRadius: 8,
            //       ),
            //     ],
            //   ),
            //   curve: Curves.easeInOutSine,
            // ),
            Row(
              children: [
                const Spacer(),
                Digit(number: hour1),
                const SizedBox.square(dimension: 10),
                Digit(number: hour2),
                Text(
                  " : ",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                Digit(number: minute1),
                const SizedBox.square(dimension: 10),
                Digit(number: minute2),
                Text(
                  " : ",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                Digit(number: second1),
                const SizedBox.square(dimension: 10),
                Digit(number: second2),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
