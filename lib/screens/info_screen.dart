import 'package:covid_app/config/styles.dart';
import 'package:covid_app/models/strain.dart';
import 'package:covid_app/widgets/info_list.dart';
import 'package:covid_app/widgets/info_list_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  var selected = 0;
  final pageController = PageController();
  final strain = Strain.generateButton();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 3, 100),
        title: const Text(
          'อาการ! COVID-19',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Scaffold(
        backgroundColor: kBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //แสดงหมวดหมู่
          CovidList(selected, (int index) {
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }, strain),

          //แสดงรายละเอียดแต่ละสายพันธุ์
          Expanded(
            child: CovidListView(
              selected,
              (int index) {
                setState(() {
                  selected = index;
                });
              },
              pageController,
              strain,
            ),
          ),
          //เลื่อนไปแต่ละหมวดหมู่
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: strain.list.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                    width: 10,
                    height: 10,
                    color: kBackground,
                    borderRadius: BorderRadius.circular(10),
                    dotBorder: DotBorder(
                      color: kPrimaryColor,
                      padding: 2,
                      width: 2,
                    )),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          ),
        ]),
      ),
    );
  }
}
