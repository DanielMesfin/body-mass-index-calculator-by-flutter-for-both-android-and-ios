import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color newColor;
  final Widget cardChild;
  final Function()? onPress;
  ReusableCard({required this.newColor,required this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: newColor,
          borderRadius: BorderRadius.circular(10.0),),
      ),
    );
  }
}
