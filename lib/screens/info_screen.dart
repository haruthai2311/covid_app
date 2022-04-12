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
    //final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 144, 90, 231),
        title: const Text(
          'อาการ! COVID-19',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Scaffold(
        backgroundColor: kBackground,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CovidList(selected, (int index) {
            setState(() {
                selected = index;
              },
            );
            pageController.jumpToPage(index);
          }, strain),

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
          
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            child: SmoothPageIndicator(
              controller: pageController,
              count: strain.list.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Color.fromARGB(255, 126, 125, 126).withOpacity(0.5),
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
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
