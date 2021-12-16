// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/screens/edit_profile_screen.dart';
import 'package:present_app/screens/home_page_screen.dart';
import 'package:present_app/widgets/main_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String stdNum = '';

  String userEmail = '';

  String userName = '';
  String userPassword='';

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
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: MyColors.myGreen,
          elevation: 0.0,
          title: Text(' الملف الشخصي'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: 130,
                        color: MyColors.myGreen,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: AssetImage(
                                        'assets/images/profile.jpg')),
                              ),
                             /* Positioned(
                                top: 90,
                                right: 7,
                                child: MaterialButton(
                                  height: 5,
                                  child: Text(
                                    'تعديل',
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(1),
                                  color: MyColors.myGreen,
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),*/
                            ],
                          ),
                          SizedBox(height: 10,),
                           MaterialButton(
                             
                             minWidth: double.infinity,
                          child: ListTile(
                              title: Text(
                                userName,
                                style: TextStyle(color: MyColors.myWhite),
                              ),
                              leading: Text(
                                "الاسم :",
                                style: TextStyle(color: MyColors.myWhite,),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: MyColors.myWhite,
                                size: 20,
                              ),
                            ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: MyColors.myGreen,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushNamed(EditProfileScreen.routeName,arguments: userName);
                          },
                        ),
                        SizedBox(height: 15,),
                          MaterialButton(
                             
                             minWidth: double.infinity,
                          child: ListTile(
                              title: Text(
                                userEmail,
                                style: TextStyle(color: MyColors.myWhite,fontSize: 13),
                              ),
                              leading: Text(
                                "الايميل :",
                                style: TextStyle(color: MyColors.myWhite,),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: MyColors.myWhite,
                                size: 20,
                              ),
                            ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          
                          color: MyColors.myGreen,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushNamed(EditProfileScreen.routeName,arguments: userEmail);

                          },
                        ),
                        SizedBox(height: 15,),
                        MaterialButton(
                             
                             minWidth: double.infinity,
                          child: ListTile(
                              title: Text(
                                stdNum,
                                style: TextStyle(color: MyColors.myWhite),
                              ),
                              leading: Text(
                                "الرقم الجامعي :",
                                style: TextStyle(color: MyColors.myWhite,),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: MyColors.myWhite,
                                size: 20,
                              ),
                            ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          
                          color: MyColors.myGreen,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushNamed(EditProfileScreen.routeName,arguments: stdNum);

                          },
                        ),
                        SizedBox(height: 15,),
                        MaterialButton(
                             
                             minWidth: double.infinity,
                          child: ListTile(
                              title: Text(
                                "********",
                                style: TextStyle(color: MyColors.myWhite,fontSize: 25),
                              ),
                              leading: Text(
                                "كلمة المرور :",
                                style: TextStyle(color: MyColors.myWhite,),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: MyColors.myWhite,
                                size: 20,
                              ),
                            ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          
                          color: MyColors.myGreen,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushNamed(EditProfileScreen.routeName,arguments: userPassword);

                          },
                        ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
