import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/providers/auth.dart';
import 'package:present_app/screens/start_screen.dart';
import 'package:present_app/screens/tabs_screen.dart';
import 'package:present_app/screens/use_screen.dart';
import 'package:present_app/screens/who_us.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
String  stdNum='';

String userEmail='';

String userName='';

Future<void> userData() async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    setState(() {
       userName = extractedUserData['userName'];
     userEmail = extractedUserData['userEmail'];
     stdNum = extractedUserData['stdNum'];
    });
  }

  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: MyColors.myWhite,
        child: Column(children: [
          Container(
            color: MyColors.myGreen,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
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
                   userName.toString(),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: MyColors.myWhite,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    userEmail.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: MyColors.myWhite,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            onTap: () {Navigator.of(context).pushReplacementNamed(
                            TabsScreen.routeName
                          );},
            leading: Icon(
              Icons.home,
              color: MyColors.myGray,
            ),
            title: Text("الرئيسية"),
          ),
         
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(
                            WhoUs.routeName,
                          );
            },
            leading: Icon(
              Icons.people,
              color: MyColors.myGray,
            ),
            title: Text(" من نحن"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(
                            UseScreen.routeName
                          );
            },
            leading: Icon(
              Icons.inbox,
              color: MyColors.myGray,
            ),
            title: Text("طريقة الاستخدام"),
          ),
          ListTile(
            onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(
                            StartScreen.routeName
                          );
              Provider.of<Auth>(context, listen: false).logout();
            },
            leading: Icon(
              Icons.logout,
              color: MyColors.myGray,
            ),
            title: Text("تسجيل الخروج"),
          ),
        ]),
      );
}
