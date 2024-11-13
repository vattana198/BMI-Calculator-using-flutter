import 'package:flutter/material.dart';
import '/constancts.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap; // Use VoidCallback for functions with no parameters
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the onTap parameter here
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        color: bottomColor, // Make sure bottomColor is defined
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight, // Make sure bottomContainerHeight is defined
      ),
    );
  }
}
