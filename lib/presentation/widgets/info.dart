
import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';


class Info extends StatelessWidget {
  final String name, email, image;

  const Info({Key key, this.name, this.email, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white,
                        width: 5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    color: MyColors.myGray,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: MyColors.myGreen,
                  ),
                ),
              ],
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
