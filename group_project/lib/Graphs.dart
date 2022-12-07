
import 'package:flutter/material.dart';
import 'MapMarker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class Charts extends StatefulWidget {
  Charts({Key? key, required this.posts}) : super(key: key);

  List<MapMarker>? posts;

  @override
  State<Charts> createState() => _ChartState();
}

class _ChartState extends State<Charts> {
  late List<MapMarker> _chartData;

  @override
  void initState() {
    _chartData = widget.posts!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Locations Highest Score", style: TextStyle(color: Colors.white),),

        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Scaffold(
            body: SfCartesianChart(
              series: <ChartSeries>[
                ColumnSeries<MapMarker, String>(
                  dataSource: _chartData,
                  xValueMapper: (MapMarker gdp, _) => gdp.username,
                  yValueMapper: (MapMarker gdp, _) => gdp.rating,
                ),
              ],
              primaryXAxis: CategoryAxis(),
            ),
          ),

        )
    );
  }
}
