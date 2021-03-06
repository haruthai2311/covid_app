class Covid {
  String name;
  String imgUrl;
  String about;

  Covid(this.name, this.imgUrl, this.about);

  static List<Covid> generateBT_Strain() {
    return [
      Covid(
        'สายพันธุ์อันตรายในไทย',
        'assets/images/4covid.png',
        '     เมื่อวันที่ 1 มิ.ย. 2564 องค์การอนามัยโลก (WHO) ได้ออกมาประกาศเปลี่ยนการเรียกชื่อไวรัสโควิด-19 กลายพันธุ์ โดยมีชื่อเรียกและความรุนแรงของแต่ละสายพันธุ์ดังต่อไปนี้',
      ),
      Covid(
        'สายพันธุ์อัลฟ่า',
        'assets/images/Alpha.jpg',
        '   สำหรับโควิดสายพันธุ์อัลฟ่า พบการติดเชื้อในประเทศไทยครั้งแรกเมื่อวันที่ 3 มกราคม 2564 โดยนายแพทย์ศุภกิจ ศิริลักษณ์ อธิบดีกรมวิทยาศาสตร์การแพทย์ เปิดเผยข้อมูลการรายงานขององค์กรสาธารณสุขประเทศอังกฤษ (Public Health England) และองค์การอนามัยโลก (WHO) พบว่าสายพันธุ์อัลฟ่า (อังกฤษ) เป็นสายพันธุ์ที่มีการแพร่กระจายเชื้อได้ง่ายกว่าสายพันธุ์ดั้งเดิมถึง 1.7 เท่า',
      ),
      Covid(
        'สายพันธุ์เบต้า (Beta)',
        'assets/images/Beta.jpg',
        '     สายพันธุ์เบต้าพบว่ามีอัตราการแพร่เชื้อไวขึ้น 50% จากสายพันธุ์เดิม อีกทั้งมีการกลายพันธุ์ในตำแหน่งสำคัญ จึงทำให้เชื้อไวรัสมีความสามารถในการหลบหลีกภูมิคุ้มกันที่ร่างกายสร้างขึ้น ดังนั้น ผู้ที่มีภูมิคุ้มกันหรือเคยติดเชื้อแล้วก็จะยังสามารถติดเชื้อโควิด-19 สายพันธุ์นี้ซ้ำได้อีก',
      ),
      Covid(
        'สายพันธุ์เดลต้า (Delta)',
        'assets/images/delta.png',
        '     ไวรัสโควิดสายพันธุ์เดลต้า สามารถแพร่กระจายได้ง่าย โดยใช้เวลา 5 – 10 วินาที หากอยู่ในสถานที่เดียวกัน หรือพบเจอผู้ติดเชื้อ เชื้อก็สามารถแพร่กระจายไปสู่บุคคลอื่นได้ และเชื้อยังสามารถลอยอยู่ในอากาศได้ถึง 16 ชั่วโมง',
      ),
      Covid(
        'เดลต้าพลัส (Delta Plus)',
        'assets/images/deltaplus.png',
        'อาการที่ควรระวัง',
      ),
      Covid(
        'สายพันธุ์โอไมครอน (Omicron)',
        'assets/images/omicron(B.1.1.529).png',
        '     สำหรับผู้ที่ติดเชื้อโควิดสายพันธุ์โอมิครอน (B.1.1.529) จากรายงานส่วนใหญ่ในผู้ที่ฉีดวัคซีนป้องกันโควิดแล้วมักพบว่าผู้ป่วยจะมีอาการเล็กน้อยหรือแทบจะไม่แสดงอาการเลย โดยอาจพบอาการเหล่านี้ได้',
      ),
      Covid(
        'โอไมครอนสายพันธ์ใหม่',
        'assets/images/omicron_new.png',
        '     ล่าสุด แพทย์ผู้เชี่ยวชาญประเทศอังกฤษ ได้อัพเดทอาการใหม่ของผู้ติดเชื้อโควิดสายพันธุ์โอมิครอนเพิ่มเติม 5 อาการ ซึ่งอาการเหล่านี้แตกต่างจากโควิดสายพันธุ์อื่นๆ',
      ),
      Covid(
        'สายพันธุ์แลมบ์ดา (Lampda)',
        'assets/images/lampda.png',
        '     WHO จัดให้เป็นสายพันธุ์ที่ต้องให้ความสนใจ (Variants of Interest; VOI) เนื่องจากคาดว่า Covid-19 สายพันธุ์แลมบ์ดา (Lampda) นี้ ความรุนแรงเมื่อติดเชื้อมากกว่าสายพันธุ์อื่น แพร่เชื้อง่ายกว่าสายพันธุ์อื่นเลี่ยงประสิทธิภาพวัคซีนได้ดีมากขึ้น(แต่จากการวิจัยของสหรัฐฯ พบว่า วัคซีน mRNA ยังสามารถป้องกันสายพันธุ์แลมบ์ดาได้ดีอยู่',
      ),
    ];
  }

  static List<Covid> generateBT_Omicron() {
    return [
      Covid(
        'สายพันธุ์โอไมครอน (Omicron)',
        'assets/images/omicron(B.1.1.529).png',
        '     สำหรับผู้ที่ติดเชื้อโควิดสายพันธุ์โอมิครอน (B.1.1.529) จากรายงานส่วนใหญ่ในผู้ที่ฉีดวัคซีนป้องกันโควิดแล้วมักพบว่าผู้ป่วยจะมีอาการเล็กน้อยหรือแทบจะไม่แสดงอาการเลย โดยอาจพบอาการเหล่านี้ได้',
      ),
      Covid(
        'โอไมครอนสายพันธ์ใหม่',
        'assets/images/omicron_new.png',
        '     ล่าสุด แพทย์ผู้เชี่ยวชาญประเทศอังกฤษ ได้อัพเดทอาการใหม่ของผู้ติดเชื้อโควิดสายพันธุ์โอมิครอนเพิ่มเติม 5 อาการ ซึ่งอาการเหล่านี้แตกต่างจากโควิดสายพันธุ์อื่นๆ',
      ),
    ];
  }

  static List<Covid> generateBT_Delta() {
    return [
      Covid(
        'สายพันธุ์เดลต้า (Delta)',
        'assets/images/delta.png',
        '     ไวรัสโควิดสายพันธุ์เดลต้า สามารถแพร่กระจายได้ง่าย โดยใช้เวลา 5 – 10 วินาที หากอยู่ในสถานที่เดียวกัน หรือพบเจอผู้ติดเชื้อ เชื้อก็สามารถแพร่กระจายไปสู่บุคคลอื่นได้ และเชื้อยังสามารถลอยอยู่ในอากาศได้ถึง 16 ชั่วโมง',
      ),
      Covid(
        'เดลต้าพลัส (Delta Plus)',
        'assets/images/deltaplus.png',
        'อาการที่ควรระวัง',
      ),
    ];
  }

  static List<Covid> generateBT_Lampda() {
    return [
      Covid(
        'สายพันธุ์แลมบ์ดา (Lampda)',
        'assets/images/lampda.png',
        '     WHO จัดให้เป็นสายพันธุ์ที่ต้องให้ความสนใจ (Variants of Interest; VOI) เนื่องจากคาดว่า Covid-19 สายพันธุ์แลมบ์ดา (Lampda) นี้ ความรุนแรงเมื่อติดเชื้อมากกว่าสายพันธุ์อื่น แพร่เชื้อง่ายกว่าสายพันธุ์อื่นเลี่ยงประสิทธิภาพวัคซีนได้ดีมากขึ้น(แต่จากการวิจัยของสหรัฐฯ พบว่า วัคซีน mRNA ยังสามารถป้องกันสายพันธุ์แลมบ์ดาได้ดีอยู่',
      ),
    ];
  }

  static List<Covid> generateBT_Alpha() {
    return [
      Covid(
        'สายพันธุ์อัลฟ่า (Alpha)',
        'assets/images/Alpha.jpg',
        '   สำหรับโควิดสายพันธุ์อัลฟ่า พบการติดเชื้อในประเทศไทยครั้งแรกเมื่อวันที่ 3 มกราคม 2564 โดยนายแพทย์ศุภกิจ ศิริลักษณ์ อธิบดีกรมวิทยาศาสตร์การแพทย์ เปิดเผยข้อมูลการรายงานขององค์กรสาธารณสุขประเทศอังกฤษ (Public Health England) และองค์การอนามัยโลก (WHO) พบว่าสายพันธุ์อัลฟ่า (อังกฤษ) เป็นสายพันธุ์ที่มีการแพร่กระจายเชื้อได้ง่ายกว่าสายพันธุ์ดั้งเดิมถึง 1.7 เท่า',
      ),
    ];
  }

  static List<Covid> generateBT_Beta() {
    return [
      Covid(
        'สายพันธุ์เบต้า (Beta)',
        'assets/images/Beta.jpg',
        '     สายพันธุ์เบต้าพบว่ามีอัตราการแพร่เชื้อไวขึ้น 50% จากสายพันธุ์เดิม อีกทั้งมีการกลายพันธุ์ในตำแหน่งสำคัญ จึงทำให้เชื้อไวรัสมีความสามารถในการหลบหลีกภูมิคุ้มกันที่ร่างกายสร้างขึ้น ดังนั้น ผู้ที่มีภูมิคุ้มกันหรือเคยติดเชื้อแล้วก็จะยังสามารถติดเชื้อโควิด-19 สายพันธุ์นี้ซ้ำได้อีก',
      ),
    ];
  }
}
