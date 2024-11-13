import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {

  ReUsableCard({required this.colour , this.cardChild , this.onPress});
  
  final Color colour;
  final Widget? cardChild;
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


