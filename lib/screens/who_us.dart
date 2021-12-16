// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class WhoUs extends StatelessWidget {
  static const routeName = '/us';

  const WhoUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar:  AppBar(
      backgroundColor: MyColors.myGreen,
      elevation: 0.0,
      title: Text('   من نحن'),
      centerTitle: true,
     
    ),
        body: SingleChildScrollView(
      
      child: 
         const Center(
          child: Text(" من نحن"),
        ),
       
    ),
      ),
    );
  }
}
