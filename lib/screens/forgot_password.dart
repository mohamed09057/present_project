import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/screens/verfy_cod.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  static const routeName = '/forgot';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
   @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myWhite,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: MyColors.myGreen),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: const Text(
                        "نسيت كلمة المرور ",
                        style: TextStyle(
                          color: MyColors.myGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                             
                        const Text(
                                " ادخل  البريد الالكتروني",
                                style: TextStyle(
                                    color: MyColors.myGray,
                                    fontWeight: FontWeight.bold),
                              ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: ' البريد الالكتروني',
                          contentPadding: const EdgeInsets.all(8),
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: MyColors.myGray),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: MyColors.myGray) ),
                        ),
                        
                      ),
                     
                    
                      const SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        color: MyColors.myGreen,
                        child: const Text(
                          'ارسال رمز الاسترجاع',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        textColor: MyColors.myWhite,
                        onPressed: () {
                  Navigator.of(context).pushNamed(VerfyCodeScreen.routeName);
                        },
                      ),
                     
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
