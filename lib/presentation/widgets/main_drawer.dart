import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: MyColors.myWhite,
        child: Column(children: [
          Container(
            color: MyColors.myGreen,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/profile.jpg')),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "محمد عبدالله",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                      color: MyColors.myWhite,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "هندسة برمجيات",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: MyColors.myWhite,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.home,
              color: MyColors.myGray,
            ),
            title: Text("الرئيسية"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.assessment,
              color: MyColors.myGray,
            ),
            title: Text("تفاصيلي الدراسية"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.person,
              color: MyColors.myGray,
            ),
            title: Text("الملف الشخصي"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.inbox,
              color: MyColors.myGray,
            ),
            title: Text("طريقة الاستخدام"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.logout,
              color: MyColors.myGray,
            ),
            title: Text("تسجيل الخروج"),
          ),
        ]),
      );
}
