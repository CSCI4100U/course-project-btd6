import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'Graphs.dart';
import 'MapMarker.dart';

Widget barGraphVertical(){
  return Scaffold(
      appBar: AppBar(
        title: Text("Vertical Bar Chart", style: TextStyle(color: Colors.white),),

      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Scaffold(
          body: SfCartesianChart(
            series: <ChartSeries>[
              ColumnSeries<MapMarker, String>(
                dataSource: chartData,
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


