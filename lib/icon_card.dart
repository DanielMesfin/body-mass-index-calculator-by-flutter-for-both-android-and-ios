import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constant.dart';
class Icon_card extends StatelessWidget {

  final String label;
  final IconData inconData;
  Icon_card({required this.inconData,required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(inconData,
          size: 30.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
          style:textStyle
        ),
      ],
    );
  }
}
