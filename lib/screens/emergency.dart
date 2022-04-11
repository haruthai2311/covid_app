// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class emergencyScreen extends StatefulWidget {
  const emergencyScreen({Key? key}) : super(key: key);

  @override
  State<emergencyScreen> createState() => _emergencyScreenState();
}

class _emergencyScreenState extends State<emergencyScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('เบอร์โทรฉุกเฉิน!!!'), backgroundColor: const Color.fromARGB(255, 144, 90, 231)),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildemergency(screenHeight),
        ],
      ),
      //bottomSheet: buildButton(screenHeight),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 129, 82, 206),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'เบอร์โทรฉุกเฉินรับมือ COVID-19',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'สถานการณ์โควิด-19 ระบาดในช่วงนี้ หลายๆคนอาจจะกำลังเป็นกังวลต่อสถานการณ์ต่างๆ เช่น ยอดผู้ติดเชื้อ อาการผิดปกติของตนเอง ซึ่งหากมีปัญหาต่างๆ ไม่ว่าจะเป็นเรื่องปรึกษาโรค เจอหน้ากากอนามัยแพงกว่าปกติ หรือ เหตุฉุกเฉินใดๆ ก็ตามสามารถติดต่อที่ สายด่วน ฉุกเฉิน',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildemergency(double screenHeight) {
    final number1 = "1669";
    final number2 = "1506";
    final number3 = "1111";
    final number4 = "1422";
    final number5 = "1330";
    final number6 = "1323";
    final number7 = "1556";

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10.0),
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                   
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
               
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                  ),
                ),
                child: Text('Call', style: TextStyle(color: Colors.black)),
                onPressed: () async {
                  launch('tel://$number5');
                },
              ),
            ),
            ListTile(
              title: Text('สายด่วนสุขภาพจิต'),
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
        
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
            
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
    );
  }
}
