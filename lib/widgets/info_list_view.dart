import 'package:covid_app/models/strain.dart';
import 'package:covid_app/widgets/info_item.dart';
import 'package:flutter/material.dart';

class CovidListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Strain strain;
  CovidListView(
      this.selected, this.callback, this.pageController, this.strain);

  @override
  Widget build(BuildContext context) {
    final category = strain.list.keys.toList();
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: category
            .map((e) => ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    CovidItem(strain.list[category[selected]]![index]),
                separatorBuilder: (_, index) => SizedBox(height: 15),
                itemCount: strain.list[category[selected]]!.length))
            .toList(),
      ),
    );
  }
}