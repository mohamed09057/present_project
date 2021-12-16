import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';
import 'package:present_app/screens/change_password.dart';

class VerfyCodeScreen extends StatefulWidget {
  const VerfyCodeScreen({Key key}) : super(key: key);

  static const routeName = '/verfy';
  @override
  _VerfyCodeScreenState createState() => _VerfyCodeScreenState();
}

class _VerfyCodeScreenState extends State<VerfyCodeScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
   FocusNode pin2FocusNode;
   FocusNode pin3FocusNode;
   FocusNode pin4FocusNode;
  bool visibility = false;

  @override
  void initState() {
    super.initState();

    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
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
                        " ادخل الرمز المرسل",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      Form(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: TextFormField(
                                    maxLength: 1,
                                    controller: _controller1,
                                    autofocus: true,
                                    obscureText: true,
                                    style: const TextStyle(
                                        fontSize: 24, color: MyColors.myGreen),
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(2),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:  BorderSide(
                                            color: MyColors.myGray),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.myGray)),
                                    ),
                                    onChanged: (value) {
                                      nextField(value, pin2FocusNode);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                  child: TextFormField(
                                    maxLength: 1,
                                    controller: _controller2,
                                    focusNode: pin2FocusNode,
                                    obscureText: true,
                                    style: const TextStyle(
                                        fontSize: 24, color: MyColors.myGreen),
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(2),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:  BorderSide(
                                            color: MyColors.myGray),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.myGray)),
                                    ),
                                    onChanged: (value) =>
                                        nextField(value, pin3FocusNode),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                  child: TextFormField(
                                    maxLength: 1,
                                    controller: _controller3,
                                    focusNode: pin3FocusNode,
                                    obscureText: true,
                                    style: const TextStyle(
                                        fontSize: 24, color: MyColors.myGreen),
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(2),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: MyColors.myGray),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.myGray)),
                                    ),
                                    onChanged: (value) =>
                                        nextField(value, pin4FocusNode),
                                  ),
                                ),
                               
                                SizedBox(
                                  width: 60,
                                  child: TextFormField(
                                    maxLength: 1,
                                    controller: _controller4,
                                    focusNode: pin4FocusNode,
                                    obscureText: true,
                                    style: const TextStyle(
                                        fontSize: 24, color: MyColors.myGreen),
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(2),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: MyColors.myGray),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.myGray)),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        pin4FocusNode.unfocus();
                                        setState(() {
                                          visibility = true;
                                        });
                                        // Then you need to check is the code is correct or not
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            //SizedBox(height: SizeConfig.screenHeight * 0.15),
                          ],
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
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        textColor: MyColors.myWhite,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ChangePasswordScreen.routeName);
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
