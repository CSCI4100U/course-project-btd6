import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'Graphs.dart';
import 'MapMarker.dart';

Widget barGraphHorizontal(){
  return Scaffold(
      appBar: AppBar(
        title: Text("Horizontal Bar Chart", style: TextStyle(color: Colors.white),),

      ),
      body: SafeArea(
        child: Scaffold(
          body: SfCartesianChart(
            series: <ChartSeries>[
              BarSeries<MapMarker, String>(
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


