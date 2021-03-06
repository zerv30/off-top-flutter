import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:off_top_mobile/components/recordingSession/websocket.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Meter extends StatefulWidget {
  const Meter({Key key, @required this.ws}) : super(key: key);

  final MyWebSocket ws;

  @override
  MeterState createState() => MeterState();
}

class MeterState extends State<Meter> {
  @override
  void initState() {
    ws = widget.ws;
    ws.channel.stream.listen((onData) {
      dynamic incomingData = json.decode(onData);
      isOnTopic = incomingData['focus_score'];
      updateScore(isOnTopic);
    });
    super.initState();
  }

  bool isOnTopic;
  double meterScore = 50;
  MyWebSocket ws;

  void updateScore(bool isOnTopic) {
    setState(() {
      if (5 <= meterScore && !isOnTopic) {
        meterScore -= 5;
      } else if (isOnTopic && meterScore <= 95) {
        meterScore += 5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(minimum: 0, maximum: 100, ranges: <GaugeRange>[
          GaugeRange(startValue: 0, endValue: 35, color: Colors.red),
          GaugeRange(startValue: 35, endValue: 65, color: Colors.orange),
          GaugeRange(startValue: 65, endValue: 100, color: Colors.green)
        ], pointers: <GaugePointer>[
          NeedlePointer(value: meterScore)
        ], annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              widget: Container(
                  child: Text(meterScore.toString(),
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              angle: 90,
              positionFactor: 0.5)
        ])
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
