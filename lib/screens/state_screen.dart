import 'package:covid_app/widgets/covid_bar_chart.dart';
import 'package:covid_app/widgets/stats_grid_provintoday.dart';
import 'package:covid_app/widgets/stats_grid_today.dart';
import 'package:flutter/material.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({Key? key}) : super(key: key);

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 90, 231),
        title: const Text('รายงานสถานการณ์ผู้ติดเชื้อ COVID-19'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints.expand(height: 70),
              child: const TabBar(
                  indicatorColor: Color.fromARGB(255, 75, 0, 150),
                  labelColor: Color.fromARGB(255, 32, 0, 121),
                  unselectedLabelColor: Color.fromARGB(137, 113, 24, 255),
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.flag_rounded),
                      text: 'ข้อมูลภาพรวม',
                    ),
                    Tab(
                      icon: Icon(Icons.pin_drop),
                      text: 'ข้อมูลรายพื้นที่',
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        StatsGridToday(),
                        CovidBarChart(),
                        
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [StatsGridProvinceToday()],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
