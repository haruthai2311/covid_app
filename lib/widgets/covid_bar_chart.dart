import 'package:covid_app/api/covid_timeline.dart';
import 'package:covid_app/config/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidBarChart extends StatefulWidget {
  const CovidBarChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CovidBarChartState();
}

class CovidBarChartState extends State<CovidBarChart> {
  late List<CovidTimeline> _dataFromAPITimeline;

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      color: Color.fromARGB(255, 228, 227, 227),
      fontSize: 14,
    );
    return Padding(
      child: Text(meta.formattedValue, style: style),
      padding: const EdgeInsets.only(left: 8),
    );
  }

  @override
  void initState() {
    super.initState();
    getDataTimeline();
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

  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataTimeline(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            //print(result.length);
            var index = result.length - 1;
            return AspectRatio(
              aspectRatio: 1.00,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color.fromARGB(255, 89, 80, 97)
,
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
                            //แกน x
                            getTitlesWidget: (double value, TitleMeta meta) {
                              const style = TextStyle(
                                  color: Color.fromARGB(255, 228, 227, 227),
                                  fontSize: 14);
                              String text;
                              switch (value.toInt()) {
                                case 0:
                                  text = result[index - 6]
                                          .txnDate
                                          .day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      result[index - 6]
                                          .txnDate
                                          .month
                                          .toString()
                                          .padLeft(2, '0');
                                  break;
                                case 1:
                                  text = result[index - 5]
                                          .txnDate
                                          .day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      result[index - 5]
                                          .txnDate
                                          .month
                                          .toString()
                                          .padLeft(2, '0');
                                  break;
                                case 2:
                                  text = result[index - 4]
                                          .txnDate
                                          .day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      result[index - 4]
                                          .txnDate
                                          .month
                                          .toString()
                                          .padLeft(2, '0');
                                  break;
                                case 3:
                                  text = result[index - 3]
                                          .txnDate
                                          .day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      result[index - 3]
                                          .txnDate
                                          .month
                                          .toString()
                                          .padLeft(2, '0');
                                  break;
                                case 4:
                                  text = result[index - 2]
                                          .txnDate
                                          .day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      result[index - 2]
                                          .txnDate
                                          .month
                                          .toString()
                                          .padLeft(2, '0');
                                  break;
                                case 5:
                                  text = result[index - 1]
                                          .txnDate
                                          .day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      result[index - 1]
                                          .txnDate
                                          .month
                                          .toString()
                                          .padLeft(2, '0');
                                  break;
                                case 6:
                                  text = result[index]
                                          .txnDate
                                          .day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      result[index]
                                          .txnDate
                                          .month
                                          .toString()
                                          .padLeft(2, '0');
                                  break;
                                default:
                                  text = '';
                                  break;
                              }
                              return Center(child: Text(text, style: style));
                            },
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
                          color: Color.fromARGB(255, 215, 214, 215),
                          strokeWidth: 1,
                        ),
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      groupsSpace: 28,
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barsSpace: 1,
                          barRods: [
                            BarChartRodData(
                                toY: result[index - 6].newCase.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph1Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                            BarChartRodData(
                                toY: result[index - 6].newRecovered.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph2Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barsSpace: 1,
                          barRods: [
                            BarChartRodData(
                                toY: result[index - 5].newCase.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 11000000000, dark),
                                ],
                                color: graph1Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                            BarChartRodData(
                                toY: result[index - 5].newRecovered.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph2Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barsSpace: 1,
                          barRods: [
                            BarChartRodData(
                                toY: result[index - 4].newCase.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 6000000000, dark),
                                ],
                                color: graph1Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                            BarChartRodData(
                                toY: result[index - 4].newRecovered.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph2Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barsSpace: 1,
                          barRods: [
                            BarChartRodData(
                                toY: result[index - 3].newCase.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 1000000000.5, dark),
                                ],
                                color: graph1Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                            BarChartRodData(
                                toY: result[index - 3].newRecovered.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph2Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barsSpace: 1,
                          barRods: [
                            BarChartRodData(
                                toY: result[index - 2].newCase.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph1Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                            BarChartRodData(
                                toY: result[index - 2].newRecovered.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph2Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                          ],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barsSpace: 1,
                          barRods: [
                            BarChartRodData(
                                toY: result[index - 1].newCase.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 11000000000, dark),
                                ],
                                color: graph1Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                            BarChartRodData(
                                toY: result[index - 1].newRecovered.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph2Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                          ],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barsSpace: 1,
                          barRods: [
                            BarChartRodData(
                                toY: result[index].newCase.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 11000000000, dark),
                                ],
                                color: graph1Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                            BarChartRodData(
                                toY: result[index].newRecovered.toDouble(),
                                rodStackItems: [
                                  // BarChartRodStackItem(0, 2000000000, dark),
                                ],
                                color: graph2Color,
                                width: 10,
                                borderRadius:
                                    const BorderRadius.all(Radius.zero)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const LinearProgressIndicator(
            color: Colors.grey,
            backgroundColor: Colors.white,
          );
        });
  }
}
