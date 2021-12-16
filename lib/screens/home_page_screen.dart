import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/screens/scan_qr_code.dart';
import 'package:present_app/screens/subjects_screen.dart';
import 'package:present_app/widgets/main_drawer.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = '/homepage-screen';
  const HomePageScreen({Key key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: MyColors.myGreen,
          elevation: 0.0,
          title: Text(' الرئيسية'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: 150,
                        color: MyColors.myGreen,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.report),
                        SizedBox(width: 5,),
                        Text(
                          ' تقارير الحضور  ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    color: MyColors.myGreen,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.of(context).pushNamed(SubjectsScreen.routeName);
                    }
                  ),
                ),
              
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code),
                        SizedBox(width: 5,),
                        Text(
                          'اخذ حضور ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    color: MyColors.myGreen,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.of(context).pushNamed(ScanQrCodeScreen.routeName);
                    }
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
