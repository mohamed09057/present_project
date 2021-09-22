import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var username;
  var email;
  bool isSignIn = false;
  getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString("username");
    email = preferences.getString("email");
    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getpref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyColors.myWhite,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: isSignIn
                  ? Text(username)
                  : Text(
                      "لم تسجل دخولك بعد",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
              accountEmail: isSignIn
                  ? Text(email)
                  : Text(
                      "قم بتسجيل الدخول او التسجيل",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
              currentAccountPicture: isSignIn
                  ? Container(
                      //margin: EdgeInsets.only(bottom: 10),
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/jjj.jpg'),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: MyColors.myGray
                      ),
                      backgroundColor: MyColors.myWhite,
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: MyColors.myWhite,
              height: 1,
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                'الرئيسية',
                style: TextStyle(
                  color: MyColors.myWhite,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: MyColors.myWhite,
              ),
              onTap: () {
              },
            ),
            isSignIn
                ? ListTile(
                    title: Text(
                      ' اضافة اعلان',
                      style: TextStyle(
                        color: MyColors.myWhite,
                      ),
                    ),
                    leading: Icon(
                      Icons.add,
                      color: MyColors.myWhite,
                    ),
                    onTap: () {
                    },
                  )
                : SizedBox(
                    height: 0,
                  ),
            ListTile(
              title: Text(
                'عن التطبيق',
                style: TextStyle(
                  color: MyColors.myWhite,
                ),
              ),
              leading: Icon(
                Icons.info,
                color: MyColors.myWhite,
              ),
              onTap: () {
               
              },
            ),
            isSignIn
                ? ListTile(
                    title: Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: MyColors.myWhite,
                      ),
                    ),
                    leading: Icon(
                      FontAwesomeIcons.signOutAlt,
                      color: MyColors.myWhite,
                    ),
                    onTap: () async {
                    },
                  )
                : ListTile(
                    title: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: MyColors.myWhite,
                      ),
                    ),
                    leading: Icon(
                      FontAwesomeIcons.signInAlt,
                      color: MyColors.myWhite,
                    ),
                    onTap: () {},
                  ),
          ],
        ),
      ),
    );
  }
}
