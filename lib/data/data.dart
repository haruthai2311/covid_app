import 'package:http/http.dart' as http;

final prevention = [
  {'assets/images/distance.png': 'เว้นระยะห่าง\nอย่างน้อย 2 เมตร'},
  {'assets/images/wash_hands.png': 'หมั่นล้างมือ\nให้สะอาด'},
  {'assets/images/mask.png': 'สวมหน้ากาก\nอนามัย'},
];

// List<CovidToDay> _dataFromAPI;

// Future<List<CovidToDay>> getData() async {
//   print('get data');
//   //var url = 'https://covid19.ddc.moph.go.th/api/Cases/today-cases-all';
//   var response = await http.get(
//       Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all'));

//   _dataFromAPI = covidToDayFromJson(response.body);

//   return _dataFromAPI;
// }

final covidDailyNewCases = [12.17, 11.15, 10.02, 11.21, 13.83, 14.16, 14.30];
