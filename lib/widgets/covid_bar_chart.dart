import 'package:covid_app/api/covid_timeline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class CovidBarChart extends StatefulWidget {
  const CovidBarChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CovidBarChartState();
}

class CovidBarChartState extends State<CovidBarChart> {

  late List<CovidTimeline> _dataFromAPITimeline = [];
  
  Widget bottomTitles(double value, TitleMeta meta) {
    const style =
        TextStyle(color: Color.fromARGB(255, 70, 70, 70), fontSize: 14);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mn';
        break;
      case 1:
        text = 'Te';
        break;
      case 2:
        text = 'Wd';
        break;
      case 3:
        text = 'Tu';
        break;
      case 4:
        text = 'Fr';
        break;
      case 5:
        text = 'St';
        break;
      case 6:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return Center(child: Text(text, style: style));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      color: Color.fromARGB(255, 72, 72, 72),
      fontSize: 14,
    );
    return Padding(
      child: Text(meta.formattedValue, style: style),
      padding: const EdgeInsets.only(left: 8),
    );
  }
  Future<List<CovidTimeline>> getDataTimeline() async {
    print('get data');
    //var url = 'https://covid19.ddc.moph.go.th/api/Cases/timeline-cases-all';
    var response = await http.get(Uri.parse(
        'https://covid19.ddc.moph.go.th/api/Cases/timeline-cases-all'));
    //_dataFromAPI = covidToDayFromJson(response.body);
    //return _dataFromAPI;
    print(response.body);
    _dataFromAPITimeline = covidTimelineFromJson(response.body);
    print(_dataFromAPITimeline);
    return _dataFromAPITimeline;
  }
  
  List<charts.Series<CovidTimeline, DateTime>> _createSampleData() {
    return [
      charts.Series<CovidTimeline, DateTime>(
        data: _dataFromAPITimeline,
        id: 'new case',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (CovidTimeline covidTimeline, _) =>
            (covidTimeline.updateDate),
        measureFn: (CovidTimeline covidTimeline, _) => covidTimeline.newCase,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: bottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: leftTitles,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Color.fromARGB(255, 222, 222, 222),
                  strokeWidth: 1,
                ),
                drawVerticalLine: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 35,
              barGroups: getData(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 7,
        barRods: [
          BarChartRodData(
              toY: 17000,
              rodStackItems: [
                // BarChartRodStackItem(0, 2000000000, dark),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 7,
        barRods: [
          BarChartRodData(
              toY: 31000,
              rodStackItems: [
                // BarChartRodStackItem(0, 11000000000, dark),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 7,
        barRods: [
          BarChartRodData(
              toY: 34000,
              rodStackItems: [
                // BarChartRodStackItem(0, 6000000000, dark),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 7,
        barRods: [
          BarChartRodData(
              toY: 14000,
              rodStackItems: [
                // BarChartRodStackItem(0, 1000000000.5, dark),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 7,
        barRods: [
          BarChartRodData(
              toY: 17000,
              rodStackItems: [
                // BarChartRodStackItem(0, 2000000000, dark),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: 7,
        barRods: [
          BarChartRodData(
              toY: 31000,
              rodStackItems: [
                // BarChartRodStackItem(0, 11000000000, dark),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: 7,
        barRods: [
          BarChartRodData(
              toY: 31000,
              rodStackItems: [
                // BarChartRodStackItem(0, 11000000000, dark),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}
