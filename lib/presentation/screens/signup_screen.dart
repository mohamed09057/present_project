import 'package:darabalsadaa/conistants/my_colors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool ischecked = true;
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
                      Text(
                        "انشاء حساب",
                        style: TextStyle(
                          fontSize: 30,
                          color: MyColors.myGray,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[20],
                          hintText: 'الاسم الاول والاخير',
                          contentPadding: const EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[20],
                          hintText: 'البريد الالكتروني',
                          contentPadding: const EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[20],
                          hintText: 'رقم الهاتف',
                          contentPadding: const EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[20],
                          hintText: 'كلمة السر',
                          contentPadding: const EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: MyColors.myGreen,
                              value: ischecked,
                              onChanged: (value) {
                                setState(() {
                                  ischecked = value;
                                });
                              }),
                          Text(
                            "من فضلك سجلني لمدة شهر",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                        child: Text(
                          'تسجيل',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        shape: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: MyColors.myGreen, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(15),
                        textColor: MyColors.myGreen,
                        onPressed: () {},
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
