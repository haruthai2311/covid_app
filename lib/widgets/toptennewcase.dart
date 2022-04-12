import 'package:covid_app/api/covid_provincestoday.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopTenNewcase extends StatefulWidget {
  const TopTenNewcase({Key? key}) : super(key: key);

  @override
  State<TopTenNewcase> createState() => _TopTenNewcaseState();
}

class _TopTenNewcaseState extends State<TopTenNewcase> {
  late List<CovidToDayProvinces> _dataFromAPIProvin;

  @override
  void initState() {
    super.initState();
    //getData();
    getDataProvin();
  }

  // Future<List<CovidToDay>> getData() async{
  //   print('get data');
  //   //var url = 'https://covid19.ddc.moph.go.th/api/Cases/today-cases-all';
  //   var response = await http.get(Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all'));
  //   //_dataFromAPI = covidToDayFromJson(response.body);
  //   //return _dataFromAPI;
  //   print(response.body);
  //   _dataFromAPI = covidToDayFromJson(response.body);
  //   print(_dataFromAPI);
  //   return _dataFromAPI;
  // }

  Future<List<CovidToDayProvinces>> getDataProvin() async {
    var response = await http.get(Uri.parse(
        'https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces'));
    //print(response.body);
    _dataFromAPIProvin =
        covidToDayProvincesFromJson(response.body).cast<CovidToDayProvinces>();
    // print(_dataFromAPIProvin);

    return _dataFromAPIProvin;
  }

  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDataProvin(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;

          var casenewn = [];
          for (var i = 0; i < result.length; i++) {
            //print(result[i].newCase);
            casenewn.add(result[i].newCase);
            //print(casenewsort);

            //

          }
          print(casenewn);

          var casenew = [];
          for (var i = 0; i < result.length; i++) {
            //print(result[i].newCase);
            casenew.add(result[i].newCase);
            //print(casenewsort);
            casenew.sort();
            //print(casenew);

          }
          print(casenew);

          var topten = [];
          for (int i = casenew.length - 10; i < casenew.length; i++) {
            topten.add(casenew[i]);
          }
          print(topten);
          print(casenewn.indexOf(topten[9]));

          return AspectRatio(
              aspectRatio: 1.00,
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  color: Color.fromARGB(255, 218, 199, 235),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(children: <Widget>[
                       
                         Text(//วันที่
                         
                              result[casenewn.indexOf(topten[9])]
                                      .txnDate
                                      .day
                                      .toString()
                                      .padLeft(2, '0') +
                                  '-' +
                                  result[casenewn.indexOf(topten[9])]
                                      .txnDate
                                      .month
                                      .toString()
                                      .padLeft(2, '0') +
                                  '-' +
                                  result[casenewn.indexOf(topten[9])]
                                      .txnDate
                                      .year
                                      .toString()
                                      .padLeft(4, '0'),
                                      textAlign: TextAlign.right,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 220, 0, 0),
                                  fontSize: 16),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                    child: Text(
                                      '10 จังหวัด',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                 
                              ],
                            ),
                           
                            const SizedBox(
                              width: 4,
                            ),
                             
                          
                        const Text(
                              'ติดเชื้อใหม่สูงสุด',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 220, 0, 0),
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                      ]))));
        }
        return const LinearProgressIndicator();
      },
    );
  }
}
