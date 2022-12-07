import 'package:flutter/material.dart';
import 'Graphs.dart';
import 'MapMarker.dart';

class Data extends StatefulWidget {
  Data({Key? key, required this.Locations}) : super(key: key);

  List<MapMarker>? Locations;

  @override
  State<Data> createState() => _DataState();
}
final List<MapMarker> chartData = [];
class _DataState extends State<Data> {
  List<MapMarker> _chartData =  [];

  @override
  void initState() {
    super.initState();
    _chartData = widget.Locations!;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            title: Text('Locations', style: TextStyle(color: Colors.white),),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Charts(posts: _chartData,),
                    )
                    );
                  },
                  icon: Icon(Icons.bar_chart_rounded)
              )
            ],
          ),
          body: DataTable(
              columns: [
                DataColumn(label: Text('User')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Rating'))
              ],
              rows: _chartData.map(
                      (MapMarker mm) => DataRow(
                      cells: [
                        DataCell(
                            Text(mm.username.toString())
                        ),
                        DataCell(
                            Text('lat: ${(mm.location?.latitude).toString()}, long ${(mm.location?.latitude).toString()}')
                        ),
                        DataCell(
                            Text(mm.rating.toString())
                        ),
                      ]
                  )
              ).toList(),


            ),

          );


  }

}
