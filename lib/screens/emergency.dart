// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class emergencyScreen extends StatefulWidget {
  const emergencyScreen({Key? key}) : super(key: key);

  @override
  State<emergencyScreen> createState() => _emergencyScreenState();
}

class _emergencyScreenState extends State<emergencyScreen> {
  final number1 = "1669";
  final number2 = "1506";
  final number3 = "1111";
  final number4 = "1422";
  final number5 = "1330";
  final number6 = "1323";
  final number7 = "1556";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 144, 90, 231),
          title: const Text('เบอร์โทรฉุกเฉิน COVID-19'),
        ),
        body: Column(
          children: [ Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'สายด่วน',
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ListTile(
                    title: Text('สถาบันการแพทย์ฉุกเฉินแห่งชาติ'),
                    subtitle: Text(number1),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.niems.go.th/1/upload/migrate/file/Logo4C(2).jpg'),
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        launch('tel://$number1');
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('สำนักงานประกันสังคม'),
                    subtitle: Text(number2),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://logo-th.com/wp-content/uploads/2019/07/%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B1%E0%B8%99%E0%B8%AA%E0%B8%B1%E0%B8%87%E0%B8%84%E0%B8%A1.jpg'),
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        launch('tel://$number2');
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('ศูนย์บริการข้อมูลภาครัฐ'),
                    subtitle: Text(number3),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.egov.go.th/upload/eservice-thumbnail/img_e0ae2dfedb0e2b36effe4494adfe06a6.png'),
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        launch('tel://$number3');
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('กระทรวงสาธารณะสุข'),
                    subtitle: Text(number4),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Seal_of_the_Ministry_of_Public_Health_of_Thailand.svg/1200px-Seal_of_the_Ministry_of_Public_Health_of_Thailand.svg.png'),
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        launch('tel://$number4');
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('สำนักงานหลักประกันสุขภาพแห่งชาติ'),
                    subtitle: Text(number5),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.nhso.go.th/storage/uploads/news/20210427155056907.png'),
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        launch('tel://$number5');
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('สายด่วยสุขภาพจิต'),
                    subtitle: Text(number6),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.techxcite.com/topics/33807/filemanager/5ey.jpg'),
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        launch('tel://$number6');
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('สำนักงานคณะกรรมการอาหารและยา'),
                    subtitle: Text(number7),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://itp1.itopfile.com/ImageServer/cc50280bd329c9d5/0/0/iTopPlus1296042808055.webp'),
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.black)),
                      onPressed: () async {
                        launch('tel://$number7');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
