import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_chart/chart_line.dart';
import 'package:my_chart/provider/mystream_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) => MyStreamProvider(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text('Flutter Chart For Eld'),
            centerTitle: true,
          ),
          body: const AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MyStreamProvider>(context);
    List<String> hours = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12',
    ];
    List<Widget> text = [];

    List<Widget> buildRow() {
      for (var i = 0; i < hours.length; i++) {
        text.add(
          Text(
            hours[i],
            style: const TextStyle(fontSize: 8),
          ),
        );
      }
      for (var i = 0; i < text.length; i++) {
        if (text.isNotEmpty) {
          text.first = const Text(
            'M',
            style: TextStyle(fontSize: 8),
          );
          text.last = const Text(
            'M',
            style: TextStyle(fontSize: 8),
          );
          text[11] = const Text(
            'N',
            style: TextStyle(fontSize: 8),
          );
        }
      }
      return text;
    }

    Size size = const Size(double.infinity, double.infinity);

    return Padding(
      padding: const EdgeInsets.only(
        top: 90,
        left: 5,
        right: 5,
      ),
      child: Column(
        children: [
          Container(
            height: 68,
            padding: const EdgeInsets.only(top: 2),
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 207, 226, 250),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'OFF',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'SB ',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'D',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ON',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: buildRow(),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: CustomPaint(
                                foregroundPainter: GridPainter(
                                  rows: 4,
                                  columns: hours.length,
                                  gridColor: const Color(0xFF9EBAE4),
                                ),
                                size: Size.infinite,
                              ),
                            ),
                            GestureDetector(
                              child: CustomPaint(
                                painter: LinePainter(
                                    model: model, chartLines: model.chartLines),
                                // painter: SvgPainter(),
                                child: Container(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  LinePainter({
    required this.model,
    required this.chartLines,
    // required this.onLineTap,
  });

  final MyStreamProvider model;
  final List<ChartLine> chartLines;
  // final Function(ChartLine) onLineTap;
  @override
  void paint(Canvas canvas, Size size) {
    for (var line in chartLines) {
      final paint = Paint()
        ..color = line.color
        // const Color(0xFF1CA2BF)
        ..strokeWidth = 2
        ..style = PaintingStyle.fill;

      canvas.drawLine(line.startPoint, line.endPoint, paint);
    }

//1
    // canvas.drawLine(Offset(1, size.height / 8),
    //     Offset(size.width / 45, size.height / 8), paint);
    // //2
    // canvas.drawLine(Offset(size.width / 45, size.height / 8.5),
    //     Offset(size.width / 45, size.height / 1.13), paint);
    // //3
    // canvas.drawLine(Offset(size.width / 45, size.height / 1.14),
    //     Offset(size.width / 9.5, size.height / 1.14), paint);
    // //4
    // canvas.drawLine(Offset(size.width / 9.5, size.height / 1.14),
    //     Offset(size.width / 9.5, size.height / 9), paint);
    // //5
    // canvas.drawLine(
    //     Offset(size.width / 9.5, size.height / 8.5),
    //     Offset((size.width / 7) + (size.width / 250), size.height / 8.5),
    //     paint);
    // //6
    // canvas.drawLine(
    //     Offset((size.width / 7) + (size.width / 250), size.height / 9.2),
    //     Offset((size.width / 7) + (size.width / 250), size.height / 1.5),
    //     paint);
    // //7
    // canvas.drawLine(
    //     Offset((size.width / 7) + (size.width / 250), size.height / 1.5),
    //     Offset(size.width / 3.3, size.height / 1.5),
    //     paint);
    // canvas.drawLine(Offset(size.width / 3.3, size.height / 1.5),
    //     Offset(size.width / 3.3, size.height / 2.65), paint);
    // canvas.drawLine(Offset(size.width / 3.3, size.height / 2.65),
    //     Offset(size.width / 2.55, size.height / 2.65), paint);
    // canvas.drawLine(Offset(size.width / 2.55, size.height / 2.65),
    //     Offset(size.width / 2.55, size.height / 1.1), paint);
    // canvas.drawLine(Offset(size.width / 2.55, size.height / 2.65),
    //     Offset(size.width / 2.55, size.height / 1.1), paint);
    // canvas.drawLine(Offset(size.width / 2.55, size.height / 1.1),
    //     Offset(size.width / 1.65, size.height / 1.1), paint);
    // canvas.drawLine(Offset(size.width / 1.65, size.height / 1.1),
    //     Offset(size.width / 1.65, size.height / 1.6), paint);
    // canvas.drawLine(Offset(size.width / 1.65, size.height / 1.6),
    //     Offset(size.width / 1.3, size.height / 1.6), paint);
    // canvas.drawLine(Offset(size.width / 1.3, size.height / 1.6),
    //     Offset(size.width / 1.3, size.height / 1.1), paint);
    // canvas.drawLine(Offset(size.width / 1.3, size.height / 1.1),
    //     Offset(size.width, size.height / 1.1), paint);

    // if (model.lineBuild.isPaused) {
    //   canvas.drawLine(
    //       Offset(model.lineWidth.toDouble(), 8),
    //       Offset(model.lineWidth.toDouble(), 8 + 17),
    //       paint..color = Colors.green);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class GridPainter extends CustomPainter {
  final int rows, columns;
  Color gridColor;

  GridPainter(
      {required this.rows, required this.columns, required this.gridColor});
  @override
  void paint(Canvas canvas, Size size) {
    final cellWidth = size.width / columns;
    final cellHeight = size.height / rows;

    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

//Рисуем вертикальные линии
    for (var i = 0; i <= columns; i++) {
      final x = i * cellWidth;

      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    //Рисуем горизонтальные линии
    for (var i = 0; i <= rows; i++) {
      final y = i * cellHeight;

      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) {
    return oldDelegate.rows != rows ||
        oldDelegate.columns != columns ||
        oldDelegate.gridColor != gridColor;
  }
}

class SvgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF9EBAE4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
