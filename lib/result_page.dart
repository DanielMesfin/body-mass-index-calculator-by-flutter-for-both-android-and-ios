import 'dart:math';

import 'package:flutter/material.dart';
import 'constant.dart';

class ResultPage extends StatelessWidget {
  final int wight;
   int hight;
  ResultPage(this.hight,this.wight);

    Widget build(BuildContext context) {

    var result =wight/pow((hight/100), 2);
      return  Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATER'),
          backgroundColor: Color(0xFF0A0E21),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('Result of IBM' ,style: kNumberText,),
             Text(result.toString()),
             Text('Discrption of Data form ')
          ],
        )
      );
    }
  }



