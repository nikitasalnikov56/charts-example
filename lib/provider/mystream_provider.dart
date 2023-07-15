import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_chart/chart_line.dart';

class MyStreamProvider extends ChangeNotifier {
  MyStreamProvider() {
    // addChart();
  }
  late StreamSubscription<int> lineBuild;
  int lineWidth = 0;
  int time = 1;
  int func() {
    Stream<int> lineTick =
        Stream.periodic(Duration(seconds: time), (tick) => tick);
    lineBuild = lineTick.listen((tick) {
      lineWidth = tick;
      notifyListeners();
    });

    Future.delayed(Duration(seconds: time + 33))
        .then((value) => lineBuild.pause());

    return lineWidth;
  }

  List<ChartLine> chartLines = [
    ChartLine(
      startPoint: const Offset(0, 5),
      endPoint: const Offset(10, 5),
      color: Colors.red,
    ),
    ChartLine(
      startPoint: const Offset(10, 5),
      endPoint: const Offset(10, 25),
      color: Colors.green,
    ),
  ];

  // addChart() {
  //   for (var i = 0; i < 4; i++) {
  //     if (i == 0) {
  //       chartLines.add(
  //         ChartLine(
  //           startPoint:  Offset(0, 5),
  //           endPoint: const Offset(80, 5),
  //           color: Colors.red,
  //         ),
  //       );
  //     } else if (i == 1) {
  //       chartLines.add(
  //         ChartLine(
  //           startPoint: const Offset(80, 5),
  //           endPoint: const Offset(80, 20),
  //           color: Colors.green,
  //         ),
  //       );
  //     }
  //   }
  // }
}
