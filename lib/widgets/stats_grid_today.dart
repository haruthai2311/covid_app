import 'package:covid_app/api/covid_today.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatsGridToday extends StatefulWidget {
  
  const  StatsGridToday({ Key? key }) : super(key: key);
  @override
  State<StatsGridToday> createState() => _StatsGridToday();
}

class _StatsGridToday extends State<StatsGridToday> {
  late List<CovidToDay> _dataFromAPI;

  @override
  void initState() {
    super.initState();
    getData();
  }

  //สร้างเมธอดดึงข้อมูล
  Future<List<CovidToDay>> getData() async {
    var response = await http.get(
        Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all'));

    //แปลง JSON เป็น Object
    _dataFromAPI = covidToDayFromJson(response.body);
    return _dataFromAPI;
  }

  //ใช้เปลี่ยนรูปแบบจำนวนให้มีจุลภาคคั่น
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox( 
          height: MediaQuery.of(context).size.height * 0.30,
          //ใช้ FutureBuilder ในการดึงข้อมูลจาก API และนำข้อมูลมาแสดงผ่าน snapshot
          child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //ตรวจสอบสถานะการดึงข้อมูลสำเร็จ
                if (snapshot.connectionState == ConnectionState.done) {
                  var result = snapshot.data;
                  return Column(
                    children: <Widget>[
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            _buildStatCardToday(
                                'จำนวนผู้ติดเชื้อรายใหม่',
                                //ดึงข้อมูล ผู้ติดเชื้อรายใหม่มาแสดง
                                result[0]
                                    .newCase
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[0]
                                    .totalCase
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.pink),
                            _buildStatCardToday(
                                'จำนวนผู้เสียชีวิตรายใหม่',
                                result[0]
                                    .newDeath
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[0]
                                    .totalDeath
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.red),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            _buildStatCardToday(
                                'ในประเทศ',
                                result[0]
                                    .newCaseExcludeabroad
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[0]
                                    .totalCaseExcludeabroad
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.teal),
                            _buildStatCardToday(
                                'จากต่างประเทศ',
                                (result[0].newCase -
                                        result[0].newCaseExcludeabroad)
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                (result[0].totalCase -
                                        result[0].totalCaseExcludeabroad)
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.amber),
                            _buildStatCardToday(
                                'รักษาหาย',
                                result[0]
                                    .newRecovered
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[0]
                                    .totalRecovered
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.lightBlue),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return  const SizedBox(
                child: CircularProgressIndicator(color: Colors.grey,),
               width: 230.0,
              );
              })),
    );
  }

  //เป็นฟอร์มการ์ด เอาไว้เรียกใช้แสดงข้อมูล
  Expanded _buildStatCardToday(String title, String count, String subtitle,
      String subcount, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.7,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subcount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

