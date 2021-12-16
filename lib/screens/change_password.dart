import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/screens/login_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key key}) : super(key: key);

  static const routeName = '/change';
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myWhite,
          elevation: 0,
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, color: MyColors.myGreen),
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
                        " ادخل كلمة مرور جديدة",
                        style: TextStyle(
                            color: MyColors.myGray,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور الجديدة',
                          contentPadding: const EdgeInsets.all(8),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColors.myGray),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyColors.myGray)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "اعد ادخال كلمة المرور",
                        style: TextStyle(
                            color: MyColors.myGray,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور الجديدة',
                          contentPadding: const EdgeInsets.all(8),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColors.myGray),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyColors.myGray)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        color: MyColors.myGreen,
                        child: const Text(
                          'تأكيد',
                          style: TextStyle(
                            fontSize: 20,
                            color: MyColors.myWhite
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                     
                        onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
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
