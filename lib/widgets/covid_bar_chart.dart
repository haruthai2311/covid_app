import 'package:covid_app/api/covid_timeline.dart';
import 'package:covid_app/config/styles.dart';
import 'package:covid_app/widgets/legend_widget.dart';
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
  static const newCase = graph1Color;
  static const recovered = graph2Color;

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
    //print('get data');
    var response = await http.get(Uri.parse(
        'https://covid19.ddc.moph.go.th/api/Cases/timeline-cases-all'));

    //print(response.body);
    _dataFromAPITimeline = covidTimelineFromJson(response.body);
    return _dataFromAPITimeline;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataTimeline(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            var index = result.length - 1;
            return AspectRatio(
                aspectRatio: 1.00,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  color: const Color.fromARGB(255, 89, 80, 97),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            // ส่วนหัว Bar chart
                            const SizedBox(
                              width: 20,
                            ),
                            makeTransactionsIcon(),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'New Case',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 51, 51),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'Last 1 week',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 245, 189, 84),
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // บอกชื่อกราฟแต่ละแท่ง
                        LegendsListWidget(
                          legends: [
                            Legend("New case", newCase),
                            Legend("Recovered", recovered),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // ส่วน Bar chart
                        Expanded(
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
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      const style = TextStyle(
                                          color: Color.fromARGB(
                                              255, 228, 227, 227),
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
                                      return Center(
                                          child: Text(text, style: style));
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
                                checkToShowHorizontalLine: (value) =>
                                    value % 10 == 0,
                                getDrawingHorizontalLine: (value) => FlLine(
                                  color: Color.fromARGB(255, 215, 214, 214),
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
                                        toY: result[index - 6]
                                            .newCase
                                            .toDouble(),
                                        color: graph1Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                    BarChartRodData(
                                        toY: result[index - 6]
                                            .newRecovered
                                            .toDouble(),
                                        color: graph2Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 1,
                                  barsSpace: 1,
                                  barRods: [
                                    BarChartRodData(
                                        toY: result[index - 5]
                                            .newCase
                                            .toDouble(),
                                        color: graph1Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                    BarChartRodData(
                                        toY: result[index - 5]
                                            .newRecovered
                                            .toDouble(),
                                        color: graph2Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 2,
                                  barsSpace: 1,
                                  barRods: [
                                    BarChartRodData(
                                        toY: result[index - 4]
                                            .newCase
                                            .toDouble(),
                                        color: graph1Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                    BarChartRodData(
                                        toY: result[index - 4]
                                            .newRecovered
                                            .toDouble(),
                                        color: graph2Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 3,
                                  barsSpace: 1,
                                  barRods: [
                                    BarChartRodData(
                                        toY: result[index - 3]
                                            .newCase
                                            .toDouble(),
                                        color: graph1Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                    BarChartRodData(
                                        toY: result[index - 3]
                                            .newRecovered
                                            .toDouble(),
                                        color: graph2Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 4,
                                  barsSpace: 1,
                                  barRods: [
                                    BarChartRodData(
                                        toY: result[index - 2]
                                            .newCase
                                            .toDouble(),
                                        color: graph1Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                    BarChartRodData(
                                        toY: result[index - 2]
                                            .newRecovered
                                            .toDouble(),
                                        color: graph2Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 5,
                                  barsSpace: 1,
                                  barRods: [
                                    BarChartRodData(
                                        toY: result[index - 1]
                                            .newCase
                                            .toDouble(),
                                        color: graph1Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                    BarChartRodData(
                                        toY: result[index - 1]
                                            .newRecovered
                                            .toDouble(),
                                        color: graph2Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 6,
                                  barsSpace: 1,
                                  barRods: [
                                    BarChartRodData(
                                        toY: result[index].newCase.toDouble(),
                                        color: graph1Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                    BarChartRodData(
                                        toY: result[index]
                                            .newRecovered
                                            .toDouble(),
                                        color: graph2Color,
                                        width: 10,
                                        borderRadius: const BorderRadius.all(
                                            Radius.zero)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          '1 week (Day-Month)',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ));
          }
          return const LinearProgressIndicator(
            color: Colors.grey,
            backgroundColor: Colors.white,
          );
        });
  }

  Widget makeTransactionsIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          width: 4.5,
        ),
        Container(
          width: 4.5,
          height: 20,
          color: const Color.fromARGB(255, 218, 218, 218).withOpacity(0.4),
        ),
        const SizedBox(
          width: 4.5,
        ),
        Container(
          width: 4.5,
          height: 30,
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
        ),
        const SizedBox(
          width: 4.5,
        ),
        Container(
          width: 4.5,
          height: 20,
          color: const Color.fromARGB(255, 218, 218, 218).withOpacity(0.4),
        ),
        const SizedBox(
          width: 4.5,
        )
      ],
    );
  }
}
