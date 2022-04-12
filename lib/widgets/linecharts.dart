import 'package:covid_app/api/covid_timeline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LineChartDeath extends StatefulWidget {
  const LineChartDeath({Key? key}) : super(key: key);

  @override
  _LineChartDeathState createState() => _LineChartDeathState();
}

class _LineChartDeathState extends State<LineChartDeath> {
  late List<CovidTimeline> _dataFromAPITimeline;

  List<Color> gradientColors = [
    const Color.fromARGB(255, 255, 166, 0),
    const Color.fromARGB(255, 255, 0, 0),
  ];

  bool showAvg = false;
  @override
  void initState() {
    super.initState();
    getDataTimeline();
  }

  Future<List<CovidTimeline>> getDataTimeline() async {
    var response = await http.get(Uri.parse(
        'https://covid19.ddc.moph.go.th/api/Cases/timeline-cases-all'));
    _dataFromAPITimeline = covidTimelineFromJson(response.body);
    return _dataFromAPITimeline;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 185, 188, 192),
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 50:
        text = '50';
        break;
      case 100:
        text = '100';
        break;
      case 150:
        text = '150';
        break;
      case 200:
        text = '200';
        break;
      case 250:
        text = '250';
        break;
      case 300:
        text = '300';
        break;
      case 350:
        text = '350';
        break;
      case 400:
        text = '400';
        break;
      case 450:
        text = '450';
        break;
      case 500:
        text = '500';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataTimeline(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;
          var index = result.length - 1;
          return Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.5,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Color(0xff232d37)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 10.0, top: 24, bottom: 12),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            // ส่วนหัว Bar chart
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'New Dead Case',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 51, 51),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Last 1 week',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 245, 189, 84),
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: true,
                                horizontalInterval: 1,
                                verticalInterval: 1,
                                checkToShowHorizontalLine: (value) =>
                                    value % 20 == 0,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: const Color(0xff37434d),
                                    strokeWidth: 1,
                                  );
                                },
                                checkToShowVerticalLine: (value) =>
                                    value % 1 == 0,
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: const Color(0xff37434d),
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    interval: 1,
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                      const style = TextStyle(
                                        color:
                                            Color.fromARGB(255, 185, 188, 192),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      );
                                      Widget text;
                                      switch (value.toInt()) {
                                        case 0:
                                          text = Text(
                                              result[index - 6]
                                                      .txnDate
                                                      .day
                                                      .toString()
                                                      .padLeft(2, '0') +
                                                  '-' +
                                                  result[index - 6]
                                                      .txnDate
                                                      .month
                                                      .toString()
                                                      .padLeft(2, '0'),
                                              style: style);
                                          break;
                                        case 1:
                                          text = Text(
                                              result[index - 5]
                                                      .txnDate
                                                      .day
                                                      .toString()
                                                      .padLeft(2, '0') +
                                                  '-' +
                                                  result[index - 5]
                                                      .txnDate
                                                      .month
                                                      .toString()
                                                      .padLeft(2, '0'),
                                              style: style);
                                          break;
                                        case 2:
                                          text = Text(
                                              result[index - 4]
                                                      .txnDate
                                                      .day
                                                      .toString()
                                                      .padLeft(2, '0') +
                                                  '-' +
                                                  result[index - 4]
                                                      .txnDate
                                                      .month
                                                      .toString()
                                                      .padLeft(2, '0'),
                                              style: style);
                                          break;
                                        case 3:
                                          text = Text(
                                              result[index - 3]
                                                      .txnDate
                                                      .day
                                                      .toString()
                                                      .padLeft(2, '0') +
                                                  '-' +
                                                  result[index - 3]
                                                      .txnDate
                                                      .month
                                                      .toString()
                                                      .padLeft(2, '0'),
                                              style: style);
                                          break;
                                        case 4:
                                          text = Text(
                                              result[index - 2]
                                                      .txnDate
                                                      .day
                                                      .toString()
                                                      .padLeft(2, '0') +
                                                  '-' +
                                                  result[index - 2]
                                                      .txnDate
                                                      .month
                                                      .toString()
                                                      .padLeft(2, '0'),
                                              style: style);
                                          break;
                                        case 5:
                                          text = Text(
                                              result[index - 1]
                                                      .txnDate
                                                      .day
                                                      .toString()
                                                      .padLeft(2, '0') +
                                                  '-' +
                                                  result[index - 1]
                                                      .txnDate
                                                      .month
                                                      .toString()
                                                      .padLeft(2, '0'),
                                              style: style);
                                          break;
                                        case 6:
                                          text = Text(
                                              result[index]
                                                      .txnDate
                                                      .day
                                                      .toString()
                                                      .padLeft(2, '0') +
                                                  '-' +
                                                  result[index]
                                                      .txnDate
                                                      .month
                                                      .toString()
                                                      .padLeft(2, '0'),
                                              style: style);
                                          break;
                                        default:
                                          text = const Text('', style: style);
                                          break;
                                      }

                                      return Padding(
                                          child: text,
                                          padding:
                                              const EdgeInsets.only(top: 8.0));
                                    },
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 1,
                                    getTitlesWidget: leftTitleWidgets,
                                    reservedSize: 42,
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(
                                      color: const Color(0xff37434d),
                                      width: 1)),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    FlSpot(0,
                                        result[index - 6].newDeath.toDouble()),
                                    FlSpot(1,
                                        result[index - 5].newDeath.toDouble()),
                                    FlSpot(2,
                                        result[index - 4].newDeath.toDouble()),
                                    FlSpot(3,
                                        result[index - 3].newDeath.toDouble()),
                                    FlSpot(4,
                                        result[index - 2].newDeath.toDouble()),
                                    FlSpot(5,
                                        result[index - 1].newDeath.toDouble()),
                                    FlSpot(
                                        6, result[index].newDeath.toDouble()),
                                  ],
                                  isCurved: true,
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: gradientColors
                                          .map(
                                              (color) => color.withOpacity(0.3))
                                          .toList(),
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                ),
                              ],
                              minX: 0,
                              maxX: 6,
                              minY: 0,
                            ),
                          ),
                        ),
                        const Text(
                          '1 week (Day-Month)',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const LinearProgressIndicator(
          color: Colors.grey,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
