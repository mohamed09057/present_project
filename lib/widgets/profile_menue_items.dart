
import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class ProfileMenueItems extends StatelessWidget {
  const ProfileMenueItems({
    Key key,
    this.title,
    this.icon,
    this.press,
  }) : super(key: key);
  final String title;
  final Icon icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //press;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
                  child: InkWell(
                    onTap: press,
                    child: Row(
            children: <Widget>[
              icon,
              SizedBox(
                width: 5.0,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 14.0,
                    color: MyColors.myGray,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.0,
              ),
              
            ],
          ),
                  ),
        ),
      ),
    );
  }
}
