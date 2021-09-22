import 'package:flutter/material.dart';
import 'package:present_app/presentation/widgets/info.dart';
import 'package:present_app/presentation/widgets/profile_menue_items.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePageBody extends StatefulWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
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
    return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Info(
            name: username.toString(),
            image: 'assets/images/jjj.jpg',
            email: email.toString(),
          ),
          SizedBox(height: 30),
          ProfileMenueItems(
              title: '   اضافة اعلان',
              icon: Icon(Icons.add),
              press: () {
              
              }),
              SizedBox(height: 20),

              ProfileMenueItems(
              title: '   اعلاناتي',
              icon: Icon(Icons.announcement),
              press: () {
               
              }),

               SizedBox(height: 20),
              ProfileMenueItems(
              title: '   عملياتي',
              icon: Icon(Icons.archive),
              press: () {
                
              }),
              
               SizedBox(height: 20),
              ProfileMenueItems(
              title: '   تسجيل خروج',
              icon: Icon(Icons.exit_to_app),
              press:  () async {
                     
                    },),
        ],
      ),
    );
  }
}

