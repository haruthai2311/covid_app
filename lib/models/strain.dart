import 'package:covid_app/models/info_covid.dart';

class Strain {
  Map<String, List<Covid>> list;
  Strain(
    this.list,
  );
  static Strain generateButton() {
    return Strain(
      {
        'สายพันธ์อันตราย': Covid.generateButton1(),
        'โอไมครอน': Covid.generateButton2(),
        'เดลต้า': Covid.generateButton3(),
        'แลมบ์ดา': Covid.generateButton4(),
        'อัลฟ่า': Covid.generateButton5(),
        'เบต้า': Covid.generateButton6(),
      },
    );
  }
}