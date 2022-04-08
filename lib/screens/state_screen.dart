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
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 144, 90, 231),
          title: const Text('รายงานสถานการณ์ผู้ติดเชื้อ COVID-19'),
          bottom: const TabBar(
            unselectedLabelColor: Color.fromARGB(255, 255, 255, 255),
            //indicatorSize: TabBarIndicatorSize.label,
            //  indicator: BoxDecoration(
            // //     //borderRadius:  BorderRadius.circular(50),
            //     color: Colors.redAccent),
            indicatorColor: Colors.purple,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.flag_rounded),
                text: 'ข้อมูลภาพรวม',
              ),
              Tab(
                icon: Icon(Icons.pin_drop),
                text: 'ข้อมูลรายพื้นที่',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [StatsGridToday(),CovidBarChart()],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [StatsGridProvinceToday()],
            ),
          ],
        ),
      ),
    );
  }
}
