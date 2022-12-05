
import 'package:flutter/material.dart';
import 'switchGraph.dart';
import 'HorizontalBarGraph.dart';
import 'MapMarker.dart';
import 'VerticalBarGraph.dart';

class Charts extends StatefulWidget {
  Charts({Key? key, required this.posts}) : super(key: key);

  List<MapMarker>? posts;

  @override
  State<Charts> createState() => _ChartState();
}
final List<MapMarker> chartData = [];
class _ChartState extends State<Charts> {
  late List<MapMarker> _chartData;

  @override
  void initState() {
    _chartData = GraphData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<LayoutExample> options = [
      LayoutExample(name: "Vertical Bar", icon: Icon(Icons.view_column),
          builder: barGraphVertical),
      LayoutExample(name: "Horizontal Bar", icon: Icon(Icons.reorder),
          builder: barGraphHorizontal),
    ];


    return DefaultTabController(length: options.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Graphs', style: TextStyle(color: Colors.white),),
            bottom: switchGraph(options),
          ),
          body: buildTabBarView(options),

        )
    );
  }
  List<MapMarker> GraphData() {

    for (MapMarker data in widget.posts!) {
      chartData.add(data);
    }
    return chartData;
  }
}
