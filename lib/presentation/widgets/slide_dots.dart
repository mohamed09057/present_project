import 'package:present_app/conistants/my_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 13 : 10,
      width: isActive ? 13 : 10,
      decoration: BoxDecoration(
        color: isActive ? MyColors.myGreen : Colors.green[100],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}