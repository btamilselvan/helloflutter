import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Charts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChartsState();
}

class ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      body: SingleChildScrollView(
        child: getPieChart(),
      ),
    );
  }

  Widget build1(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      body: SingleChildScrollView(
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
              PieChartData(sectionsSpace: 0, centerSpaceRadius: 40, sections: [
            PieChartSectionData(
              color: const Color(0xff0293ee),
              value: 20,
              title: '40%',
              showTitle: true,
              radius: 50,
              titleStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
            ),
            PieChartSectionData(
              color: Colors.green,
              value: 50,
              title: '50%',
              showTitle: true,
              radius: 50,
              titleStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
            )
          ])),
        ),
      ),
    );
  }

  Widget getPieChart() {
    return Card(
      color: Colors.black12,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: buildPieChart(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.green),
                    width: 10,
                    height: 10,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text('One')
                ],
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget buildPieChart() {
    return PieChart(PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        borderData: FlBorderData(show: false),
        sections: [
          PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 20,
            title: '40%',
            showTitle: true,
            radius: 50,
            titleStyle: TextStyle(
                fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          ),
          PieChartSectionData(
            color: Colors.green,
            value: 50,
            title: '50%',
            showTitle: true,
            radius: 50,
            titleStyle: TextStyle(
                fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          )
        ]));
  }
}
