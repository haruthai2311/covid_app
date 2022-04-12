import 'package:covid_app/config/styles.dart';
import 'package:covid_app/models/strain.dart';
import 'package:flutter/material.dart';

class CovidList extends StatelessWidget {
  final int selected;
  final Function callback;
  final Strain strain;
  CovidList(this.selected, this.callback, this.strain);
  
  @override
  Widget build(BuildContext context) {
    final category = strain.list.keys.toList();
    
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 25),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => callback(index),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selected == index ? kPrimaryColor : Color.fromARGB(255, 235, 205, 255),
            ),
            child: Text(
              category[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        separatorBuilder: (_, index) => SizedBox(width: 20),
        itemCount: category.length,
      ),
    );
  }
}