import 'package:covid_app/api/covid_provincestoday.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatsGridProvinceToday extends StatefulWidget {
  const StatsGridProvinceToday({Key? key}) : super(key: key);
  @override
  State<StatsGridProvinceToday> createState() => _StatsGridProvinceTodayState();
}

class _StatsGridProvinceTodayState extends State<StatsGridProvinceToday> {
  late List<CovidToDayProvinces> _dataFromAPIProvin;

  //ตัวเลือก dropdpwn ของจังหวัด
  String dropdownvalue = 'สกลนคร';
  var items = [
    'กระบี่',
    'กรุงเทพมหานคร',
    'กาญจนบุรี',
    'กาฬสินธุ์',
    ' กำแพงเพชร',
    'ขอนแก่น',
    'จันทบุรี',
    'ฉะเชิงเทรา',
    'ชลบุรี',
    'ชัยนาท',
    'ชัยภูมิ',
    'ชุมพร',
    'ตรัง',
    'ตราด',
    'ตาก',
    'นครนายก',
    'นครปฐม',
    'นครพนม',
    'นครราชสีมา',
    'นครศรีธรรมราช',
    'นครสวรรค์',
    'นนทบุรี',
    'นราธิวาส',
    'น่าน',
    'บึงกาฬ',
    'บุรีรัมย์',
    'ปทุมธานี',
    'ประจวบคีรีขันธ์',
    'ปราจีนบุรี',
    'ปัตตานี',
    'พระนครศรีอยุธยา',
    'พะเยา',
    'พังงา',
    'พัทลุง',
    'พิจิตร',
    'พิษณุโลก',
    'ภูเก็ต',
    'มหาสารคาม',
    'มุกดาหาร',
    'ยะลา',
    'ยโสธร',
    'ร้อยเอ็ด',
    'ระนอง',
    'ระยอง',
    'ราชบุรี',
    'ลพบุรี',
    'ลำปาง',
    'ลำพูน',
    'ศรีสะเกษ',
    'สกลนคร',
    'สงขลา',
    'สตูล',
    'สมุทรปราการ',
    'สมุทรสงคราม',
    'สมุทรสาคร',
    'สระบุรี',
    'สระแก้ว',
    'สิงห์บุรี',
    'สุพรรณบุรี',
    'สุราษฎร์ธานี',
    'สุรินทร์',
    'สุโขทัย',
    'หนองคาย',
    'หนองบัวลำภู',
    'อ่างทอง',
    'อำนาจเจริญ',
    'อุดรธานี',
    'อุตรดิตถ์',
    'อุทัยธานี',
    'อุบลราชธานี',
    'เชียงราย',
    'เชียงใหม่',
    'เพชรบุรี',
    'เพชรบูรณ์',
    'เลย',
    'แพร่',
    'แม่ฮ่องสอน'
  ];

  @override
  void initState() {
    super.initState();
    getDataProvin();
  }

  //สร้างเมธอดดึงข้อมูล
  Future<List<CovidToDayProvinces>> getDataProvin() async {
    var response = await http.get(Uri.parse(
        'https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces'));
    
    //แปลง JSON เป็น Object
    _dataFromAPIProvin =
        covidToDayProvincesFromJson(response.body).cast<CovidToDayProvinces>();
    return _dataFromAPIProvin;
  }

  //ใช้เปลี่ยนรูปแบบจำนวนให้มีจุลภาคคั่น
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          child: FutureBuilder(
              future: getDataProvin(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var result = snapshot.data;
                  return Column(
                    children: <Widget>[
                      DropdownSearch<String>(
                        //mode of dropdown
                        mode: Mode.DIALOG,
                        //to show search box
                        showSearchBox: true,
                        showSelectedItem: true,
                        searchBoxDecoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                        ),
                        popupShape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        dropdownSearchDecoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                        ),
                        //list of dropdown items
                        items: items,
                        selectedItem: dropdownvalue,
                        //เปลี่ยนค่า dropdown เป็นค่าใหม่ที่เลือก
                        onChanged: (newValue) {
                          setState(() {
                            dropdownvalue = newValue.toString();
                            //print(items.indexOf(dropdownvalue)) ;
                          });
                        },
                      ),
                     
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            _buildStatCard(
                                'จำนวนผู้ติดเชื้อรายใหม่',
                                //items.indexOf(dropdownvalue) คือตำแหน่งของ dropdown ที่เลือก แล้วดึงข้อมูลที่ตรงกับตำแหน่งของจังหวัด
                                result[items.indexOf(dropdownvalue)]
                                    .newCase
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[items.indexOf(dropdownvalue)]
                                    .totalCase
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.orange),
                            _buildStatCard(
                                'จำนวนผู้เสียชีวิตรายใหม่',
                                result[items.indexOf(dropdownvalue)]
                                    .newDeath
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[items.indexOf(dropdownvalue)]
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
                                result[items.indexOf(dropdownvalue)]
                                    .newCaseExcludeabroad
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                result[items.indexOf(dropdownvalue)]
                                    .totalCaseExcludeabroad
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.teal),
                            _buildStatCard(
                                'จากต่างประเทศ',
                                (result[items.indexOf(dropdownvalue)].newCase -
                                        result[items.indexOf(dropdownvalue)]
                                            .newCaseExcludeabroad)
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                'สะสม',
                                (result[items.indexOf(dropdownvalue)]
                                            .totalCase -
                                        result[items.indexOf(dropdownvalue)]
                                            .totalCaseExcludeabroad)
                                    .toString()
                                    .replaceAllMapped(reg, mathFunc),
                                Colors.amber),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox(
                child: CircularProgressIndicator(color: Colors.grey,),
               width: 300.0,
              );
              })),
    );
  }

  //เป็นฟอร์มการ์ด เอาไว้เรียกใช้แสดงข้อมูล
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
