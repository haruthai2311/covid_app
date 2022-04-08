import 'package:covid_app/api/covid_provincestoday.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatsGridProvinceToday extends StatefulWidget {
  const  StatsGridProvinceToday({ Key? key }) : super(key: key);
  @override

  State<StatsGridProvinceToday> createState() => _StatsGridProvinceTodayState();
}

class _StatsGridProvinceTodayState extends State<StatsGridProvinceToday> {
  late List<CovidToDayProvinces> _dataFromAPIProvin;
  
  
  @override
  void initState() {
    super.initState();
    getDataProvin();
  }

  Future<List<CovidToDayProvinces>> getDataProvin() async {
    var response = await http.get(Uri.parse(
        'https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces'));
    print(response.body);
    _dataFromAPIProvin =
        covidToDayProvincesFromJson(response.body).cast<CovidToDayProvinces>();
    print(_dataFromAPIProvin);
    return _dataFromAPIProvin;
  }

  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          child: FutureBuilder(
              future: getDataProvin(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var result = snapshot.data;
                  return Column(
                    children: <Widget>[
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            _buildStatCard(
                                'จำนวนผู้ติดเชื้อรายใหม่',
                                result[49]
                                    .newCase
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[49]
                                    .totalCase
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.orange),
                            _buildStatCard(
                                'จำนวนผู้เสียชีวิตรายใหม่',
                                result[49]
                                    .newDeath
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[49]
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
                            _buildStatCard(
                                'ผู้ติดเชื้อในประเทศ',
                                result[49]
                                    .newCaseExcludeabroad
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[49]
                                    .totalCaseExcludeabroad
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.orange),
                            _buildStatCard(
                                'จากต่างประเทศ',
                                (result[49].newCase -
                                        result[49].newCaseExcludeabroad)
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                (result[49].totalCase -
                                        result[49].totalCaseExcludeabroad)
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.amber),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const LinearProgressIndicator();
              })),
    );
  }

  Expanded _buildStatCard(String title, String count, String subtitle,
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
                fontSize: 13,
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
