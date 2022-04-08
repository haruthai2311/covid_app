import 'package:flutter/material.dart';

class emergencyScreen extends StatefulWidget {
  const emergencyScreen({ Key? key }) : super(key: key);

  @override
  State<emergencyScreen> createState() => _emergencyScreenState();
}

class _emergencyScreenState extends State<emergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 144, 90, 231),
          title: const Text('เบอร์โทรฉุกเฉิน COVID-19'),
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
      ),
    );
  }
}