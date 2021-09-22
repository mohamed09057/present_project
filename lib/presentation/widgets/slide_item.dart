import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/data/models/slide.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize: 30,
            color: MyColors.myGray,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 1.0),
          child: Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: MyColors.myGreen,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20),
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),

            ),
          ),
        ),
      ],
    );
  }
}
