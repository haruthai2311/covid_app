import 'package:covid_app/models/info_covid.dart';
import 'package:flutter/material.dart';

class CovidItem extends StatelessWidget {
  final Covid covid;
  CovidItem(this.covid);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            covid.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),

          Text(
            covid.about,style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(covid.imgUrl,height: 300,)],
          )
        ],
      ),
    );
  }
}