import 'dart:async';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../infrastructure/socketManager.dart';
import '../models/drawing.dart';
import '../infrastructure/sketcher.dart';

class DrawingPage extends StatefulWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  final GlobalKey _globalKey = GlobalKey();
  List<DrawnLine?> lines = <DrawnLine?>[];
  DrawnLine? line;
  Color selectedColor = Colors.black;
  double selectedWidth = 5.0;
  int counter = 1;

  StreamController<List<DrawnLine?>> linesStreamController = StreamController<List<DrawnLine?>>.broadcast();
  StreamController<DrawnLine?> currentLineStreamController = StreamController<DrawnLine?>.broadcast();

  Future<void> clear() async {
    setState(() {
      lines = [];
      line = null;
    });
  }

  @override
  void initState() {
    SocketManager().socket?.on(EventTypes.UPDATE_CANVAS, (data) {
      CanvasUpdateModel response = CanvasUpdateModel.fromJson(data);
      bool you = response.socketId == SocketManager().socketId;

      print("[${DateTime.now()}] Received data from ${you ? "[yourself]" : response.socketId}!");

      if (!you) {
        print("Updating canvas ...");
        setState(() {
          if (response.line != null) {
            line = DrawnLine(
              response.line!.path,
              response.line?.color,
              response.line?.width,
            );
            currentLineStreamController.add(line);
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: Stack(
        children: [
          buildAllPaths(context),
          buildCurrentPath(context),
          buildStrokeToolbar(),
          buildColorToolbar(),
        ],
      ),
    );
  }

  Widget buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(4.0),
          color: Colors.transparent,
          alignment: Alignment.topLeft,
          child: StreamBuilder<DrawnLine?>(
            stream: currentLineStreamController.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: Sketcher(
                  lines: [line],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAllPaths(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        padding: const EdgeInsets.all(4.0),
        alignment: Alignment.topLeft,
        child: StreamBuilder<List<DrawnLine?>>(
          stream: linesStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: Sketcher(
                lines: lines,
              ),
            );
          },
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);
    line = DrawnLine([point], selectedColor, selectedWidth);
  }

  void onPanUpdate(DragUpdateDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    List<Offset> paths = [...?line?.path, point];

    line = DrawnLine(paths, selectedColor, selectedWidth);
    currentLineStreamController.add(line);
  }

  void onPanEnd(DragEndDetails details) {
    lines = List.from(lines)..add(line);
    linesStreamController.add(lines);
    SocketManager().finishDrawingLine(line);
  }

  Widget buildStrokeToolbar() {
    return Positioned(
      bottom: 60.0,
      right: 22.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildStrokeButton(5.0),
          buildStrokeButton(10.0),
          buildStrokeButton(15.0),
        ],
      ),
    );
  }

  Widget buildStrokeButton(double strokeWidth) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedWidth = strokeWidth;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: strokeWidth * 2,
          height: strokeWidth * 2,
          decoration: BoxDecoration(
            color: selectedColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }

  Widget buildColorToolbar() {
    return Positioned(
      top: 100.0,
      right: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: clear,
            child: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.clear,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            height: 10.0,
          ),
          buildColorButton(Colors.red),
          buildColorButton(Colors.blueAccent),
          buildColorButton(Colors.deepOrange),
          buildColorButton(Colors.green),
          buildColorButton(Colors.lightBlue),
          buildColorButton(Colors.black),
          buildColorButton(Colors.white),
        ],
      ),
    );
  }

  Widget buildColorButton(Color color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        mini: true,
        heroTag: null,
        backgroundColor: color,
        child: Container(),
        onPressed: () {
          setState(() {
            selectedColor = color;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
