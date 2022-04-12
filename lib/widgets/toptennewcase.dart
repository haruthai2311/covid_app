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
              aspectRatio: 0.62,
              child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  color: Color.fromARGB(255, 218, 199, 235),
                  
                 child:Container(
                   decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/images/covidBgTable1.jpg'))),
                 
                  child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(children:  <Widget>[
        
                          const Text(
                            '10 จังหวัด',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'ติดเชื้อใหม่สูงสุด วันที่ ' +
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
                            style: const TextStyle(
                                color: Color.fromARGB(255, 125, 0, 0),
                                fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          DataTable(
                            columns: const [
                              DataColumn(
                                  label: Text(
                                'จังหวัด',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                              DataColumn(
                                  label: Text('รายใหม่',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('สะสม',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)))
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text(
                                    '1.' +
                                        result[casenewn.indexOf(topten[9])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[9])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[9])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '2.' +
                                        result[casenewn.indexOf(topten[8])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[8])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[8])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '3.' +
                                        result[casenewn.indexOf(topten[7])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[7])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[7])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '4.' +
                                        result[casenewn.indexOf(topten[6])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[6])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[6])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '5.' +
                                        result[casenewn.indexOf(topten[5])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[5])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[5])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '6.' +
                                        result[casenewn.indexOf(topten[4])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[4])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[4])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '7.' +
                                        result[casenewn.indexOf(topten[3])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[3])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[3])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '8.' +
                                        result[casenewn.indexOf(topten[2])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[2])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[2])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '9.' +
                                        result[casenewn.indexOf(topten[1])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[1])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[1])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                    '10.' +
                                        result[casenewn.indexOf(topten[0])]
                                            .province
                                            .toString(),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[0])]
                                        .newCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                                DataCell(Text(
                                    result[casenewn.indexOf(topten[0])]
                                        .totalCase
                                        .toString()
                                        .replaceAllMapped(reg, mathFunc),
                                    style: const TextStyle(fontSize: 16))),
                              ]),
                            ],
                          ),
                        ]),
                      ))));
        }
        return const LinearProgressIndicator();
      },
    );
  }
}
