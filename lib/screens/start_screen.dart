import 'package:present_app/conistants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:present_app/screens/login_screen.dart';
import 'package:present_app/screens/signup_screen.dart';

class StartScreen extends StatelessWidget {
  static const routeName = '/start-screen';
  const StartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image4.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.25),
                    child: Text(
                      "تطبيق حاضر",
                      style: TextStyle(
                        fontSize: 30,
                        color: MyColors.myGreen,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        MaterialButton(
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: const EdgeInsets.all(9),
                          color: MyColors.myGreen,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              LoginScreen.routeName,
                            );
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          
                          child: Text(
                            'تسجيل',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: const EdgeInsets.all(9),
                          color: MyColors.myGreen,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              SignupScreen.routeName,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
