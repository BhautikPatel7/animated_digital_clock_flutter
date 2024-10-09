import 'dart:async';

import 'package:digital_clock/sizes.dart';
import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  const Box({super.key});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  double opicity = 0.1;
  List<double> _valuesWithopacity = [
    0.1,
    1,
    0.5,
    0.2,
    0.9,
    0.3,
    0.7,
    0.1,
    0.8,
    1,
    0.5
  ];
  int currentIndex = 0;
  Timer? timer;
  updateTheCloclStyle() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        if (mounted) {
          currentIndex = (currentIndex + 1) % _valuesWithopacity.length;
          opicity = _valuesWithopacity[currentIndex];
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateTheCloclStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(Sizes.boxSize),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(opicity),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const Expanded(
          child: SizedBox.square(
            dimension: Sizes.boxSize,
            child: ColoredBox(color: Colors.orange),
          ),
        ),
        // Expanded(
        //   child: SizedBox.fromSize(
        //     size: const Size.fromRadius(Sizes.boxSize),
        //     child: DecoratedBox(
        //       decoration: BoxDecoration(
        //         color: Colors.white.withOpacity(1),
        //         shape: BoxShape.circle,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
