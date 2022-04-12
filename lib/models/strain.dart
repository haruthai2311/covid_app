import 'package:covid_app/models/info_covid.dart';

class Strain {
  Map<String, List<Covid>> list;
  Strain(
    this.list,
  );
  static Strain generateButton() {
    return Strain(
      {
        'สายพันธุ์ Covid 19': Covid.generateBT_Strain(),
        'โอไมครอน': Covid.generateBT_Omicron(),
        'เดลต้า': Covid.generateBT_Delta(),
        'แลมบ์ดา': Covid.generateBT_Lampda(),
        'อัลฟ่า': Covid.generateBT_Alpha(),
        'เบต้า': Covid.generateBT_Beta(),
      },
    );
  }
}