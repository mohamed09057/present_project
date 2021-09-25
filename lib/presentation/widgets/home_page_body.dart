import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
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
              child: Text(
                'مسح رمز الحضور   ',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(15),
              color: MyColors.myGreen,
              textColor: Colors.white,
              onPressed: () {
              },
            ),
          ),
        ],
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
