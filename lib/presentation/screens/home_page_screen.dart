import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import '../widgets/home_page_body.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildAppBar(),
        body: HomePageBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.myGreen,
      elevation: 0.0,
      title: Text('الصفحة الشخصية'),
      centerTitle: true,
      actions: <Widget>[
        MaterialButton(
          onPressed: () {},
          child: Text(
            'تعديل',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
