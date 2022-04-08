import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 37, 3, 100),
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
                  'รู้ทัน! โควิดแต่ละสายพันธุ์',
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
                Text(
                  'อาการเป็นอย่างไร?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'โควิด-19 ส่งผลต่อผู้คนในรูปแบบที่แตกต่างกันไป ผู้ที่ติดเชื้อส่วนใหญ่จะมีอาการเล็กน้อยถึงปานกลาง และหายจากโรคได้เองโดยไม่ต้องเข้ารักษาในโรงพยาบาล',
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

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              //'Prevention Tips',
              'สายพันธุ์โอไมครอน (Omicron)',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '     สำหรับผู้ที่ติดเชื้อโควิดสายพันธุ์โอมิครอน (B.1.1.529) จากรายงานส่วนใหญ่ในผู้ที่ฉีดวัคซีนป้องกันโควิดแล้วมักพบว่าผู้ป่วยจะมีอาการเล็กน้อยหรือแทบจะไม่แสดงอาการเลย โดยอาจพบอาการเหล่านี้ได้',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/omicron(B.1.1.529).png',
                      height: 320),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '     ล่าสุด แพทย์ผู้เชี่ยวชาญประเทศอังกฤษ ได้อัพเดทอาการใหม่ของผู้ติดเชื้อโควิดสายพันธุ์โอมิครอนเพิ่มเติม 5 อาการ ซึ่งอาการเหล่านี้แตกต่างจากโควิดสายพันธุ์อื่นๆ',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/omicron_new.png', height: 320),
              ],
            ),
            const SizedBox(height: 30.0),
            Text(
              'สายพันธุ์เดลต้า (Delta)',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '     ไวรัสโควิดสายพันธุ์เดลต้า สามารถแพร่กระจายได้ง่าย โดยใช้เวลา 5 – 10 วินาที หากอยู่ในสถานที่เดียวกัน หรือพบเจอผู้ติดเชื้อ เชื้อก็สามารถแพร่กระจายไปสู่บุคคลอื่นได้ และเชื้อยังสามารถลอยอยู่ในอากาศได้ถึง 16 ชั่วโมง',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/delta.png', height: 320),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/deltaplus.png', height: 320),
              ],
            ),
            const SizedBox(height: 30.0),
            Text(
              'สายพันธุ์อันตรายในไทยที่ต้องระวัง!',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '     เมื่อวันที่ 1 มิ.ย. 2564 องค์การอนามัยโลก (WHO) ได้ออกมาประกาศเปลี่ยนการเรียกชื่อไวรัสโควิด-19 กลายพันธุ์ โดยมีชื่อเรียกและความรุนแรงของแต่ละสายพันธุ์ดังต่อไปนี้',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/4covid.png', height: 320),
              ],
            ),
            const SizedBox(height: 30.0),
            Text(
              'สายพันธุ์แลมบ์ดา (Lampda)',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '     WHO จัดให้เป็นสายพันธุ์ที่ต้องให้ความสนใจ (Variants of Interest; VOI) เนื่องจากคาดว่า Covid-19 สายพันธุ์แลมบ์ดา (Lampda) นี้ ความรุนแรงเมื่อติดเชื้อมากกว่าสายพันธุ์อื่น แพร่เชื้อง่ายกว่าสายพันธุ์อื่นเลี่ยงประสิทธิภาพวัคซีนได้ดีมากขึ้น(แต่จากการวิจัยของสหรัฐฯ พบว่า วัคซีน mRNA ยังสามารถป้องกันสายพันธุ์แลมบ์ดาได้ดีอยู่',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/lampda.png', height: 320),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter();
  }
}
