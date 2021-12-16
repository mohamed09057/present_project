import 'dart:convert';

import 'package:present_app/conistants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:present_app/models/http_exception.dart';
import 'package:present_app/providers/auth.dart';
import 'package:present_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit-profile-screen';
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String stdNum = '';
  String userEmail = '';
  String userName = '';
  String userPass = '';
  String token = '';
  String userId = '';
  bool name=false;
  bool email=false;
  bool stdnum=false;
  bool pass=false;
String title='';
  TextEditingController _passwordController;
  TextEditingController _userNameController;
  TextEditingController _userEmailController;
  TextEditingController _studentNumberController;
  Future<void> userData() async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    setState(() {
      userName = extractedUserData['userName'];
      userEmail = extractedUserData['userEmail'];
      stdNum = extractedUserData['stdNum'];
      token = extractedUserData['token'];
      userId = extractedUserData['userId'];
    });

    _passwordController = TextEditingController(text: userPass);
    _userNameController = TextEditingController(text: userName);
    _userEmailController = TextEditingController(text: userEmail);
    _studentNumberController = TextEditingController(text: stdNum);
    final logic = ModalRoute.of(context).settings.arguments as String;
    if(logic==userName){
      setState(() {
        name=true;
        title='الاسم';
      });
    }else if(logic==userEmail){
      setState(() {
        email=true;
        title='الايميل';
      });
    }else if(logic==stdNum){
     setState(() {
        stdnum=true;
        title='الرقم الجامعي';
     });
    }else{
      setState(() {
        pass=true;
        title='كلمة المرور';
      });
    }
  }

  


  @override
  void initState() {
    userData();
    super.initState();
  }


  var _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text('حدث خطأ !'),
          content: Text(message),
          actions: <Widget>[
            MaterialButton(
              child: Text('تم'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (_userNameController.text != null &&
        _userEmailController.text != null &&
        _studentNumberController.text != null) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Auth>(context, listen: false)
            .editProfile(
                _userNameController.text,
                _userEmailController.text,
                _studentNumberController.text,
                _passwordController.text,
                token,
                userId)
            .then((value) {
          if (value == true) {
            Navigator.of(context).pushReplacementNamed( TabsScreen.routeName,arguments: 2);
          }
        });
        // ignore: unused_catch_clause
      } on HttpException catch (error) {
        var errorMessage = 'فشل الاتصال بالسيرفر';
        _showErrorDialog(errorMessage);
      } catch (error) {
        if (error.toString().contains(
            "FormatException: Unexpected character (at character 1)")) {
          const errorMessage = 'الايميل مستخدم مسبقا !';
          _showErrorDialog(errorMessage);
        }
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myWhite,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: MyColors.myGreen),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: MyColors.myWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "تعديل $title",
                style: TextStyle(
                  fontSize: 20,
                  color: MyColors.myGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    color: MyColors.myWhite,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                ),
                               name? TextField(
                                  controller: _userNameController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[20],
                                      contentPadding: const EdgeInsets.all(6),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.myGreen),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.myWhite),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      labelText: 'الاسم',
                                      labelStyle:
                                          TextStyle(color: MyColors.myGreen)),
                                  keyboardType: TextInputType.text,
                                ):SizedBox(height: 0,),
                                
                                email? TextField(
                                  controller: _userEmailController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[20],
                                      contentPadding: const EdgeInsets.all(6),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.myGreen),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.myWhite),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      labelText: 'الايميل',
                                      labelStyle:
                                          TextStyle(color: MyColors.myGreen)),
                                  keyboardType: TextInputType.emailAddress,
                                ):SizedBox(height: 0,),
                               
                               stdnum? TextField(
                                  controller: _studentNumberController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[20],
                                      contentPadding: const EdgeInsets.all(6),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.myGreen),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.myWhite),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      labelText: 'الرقم الجامعي',
                                      labelStyle:
                                          TextStyle(color: MyColors.myGreen)),
                                  keyboardType: TextInputType.number,
                                ):SizedBox(height: 0,),
                               
                               pass? TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[20],
                                      contentPadding: const EdgeInsets.all(10),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.myGreen),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: MyColors.myWhite),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      labelText: 'كلمة المرور',
                                      labelStyle:
                                          TextStyle(color: MyColors.myGreen)),
                                  obscureText: true,
                                  controller: _passwordController,
                                ):SizedBox(height: 0,),
                                SizedBox(
                                  height: 20,
                                ),
                                if (_isLoading)
                                  CircularProgressIndicator()
                                else
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        MaterialButton(
                                          child: Text(
                                            'تعديل ',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          color: MyColors.myGreen,
                                          textColor: Colors.white,
                                          onPressed: _submit,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
