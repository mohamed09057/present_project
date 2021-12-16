import 'package:flutter/material.dart';
import 'package:present_app/providers/auth.dart';
import 'package:present_app/providers/my_details.dart';
import 'package:present_app/providers/student_subjects.dart';
import 'package:present_app/providers/subject_attendances.dart';
import 'package:present_app/screens/change_password.dart';
import 'package:present_app/screens/edit_profile_screen.dart';
import 'package:present_app/screens/forgot_password.dart';
import 'package:present_app/screens/getting_started_screen.dart';
import 'package:present_app/screens/home_page_screen.dart';
import 'package:present_app/screens/login_screen.dart';
import 'package:present_app/screens/my_details_screen.dart';
import 'package:present_app/screens/profile_screen.dart';
import 'package:present_app/screens/scan_qr_code.dart';
import 'package:present_app/screens/signup_screen.dart';
import 'package:present_app/screens/splash_screen.dart';
import 'package:present_app/screens/start_screen.dart';
import 'package:present_app/screens/subjects_details_screen.dart';
import 'package:present_app/screens/subjects_screen.dart';
import 'package:present_app/screens/tabs_screen.dart';
import 'package:present_app/screens/use_screen.dart';
import 'package:present_app/screens/verfy_cod.dart';
import 'package:present_app/screens/who_us.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyTest());
}

class MyTest extends StatelessWidget {
  // This widget is the root of your application
  const MyTest({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
         ChangeNotifierProvider(
          create: (_) => Subjects(),
        ),
         ChangeNotifierProvider(
          create: (_) => SubjectAttendances(),
        ),
         ChangeNotifierProvider(
          create: (_) => MyDetails(),
        ),
         
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Attendance',
          theme: ThemeData(
            fontFamily: 'Cairo',
          ),
        debugShowCheckedModeBanner: false,
        home:  auth.isAuth
              ? TabsScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : GettingStartedScreen(),
                ),
        routes: {
          GettingStartedScreen.routeName : (context) => GettingStartedScreen(),
          StartScreen.routeName: (context) => const StartScreen(),
          TabsScreen.routeName: (context) => TabsScreen(),
          HomePageScreen.routeName: (context) => const HomePageScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          DetailseScreen.routeName: (context) => const DetailseScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          VerfyCodeScreen.routeName: (context) => VerfyCodeScreen(),
          ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
          ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
          EditProfileScreen.routeName: (context) => EditProfileScreen(),
           SubjectsScreen.routeName: (context) => SubjectsScreen(),
           SubjecDetailseScreen.routeName: (context) => SubjecDetailseScreen(),
           ScanQrCodeScreen.routeName: (context) => ScanQrCodeScreen(),


          
          WhoUs.routeName: (context) => WhoUs(),
          UseScreen.routeName: (context) => UseScreen(),
        },
      ),
    ));
  }
}
