import 'package:present_app/conistants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:present_app/models/http_exception.dart';
import 'package:present_app/providers/auth.dart';
import 'package:present_app/screens/forgot_password.dart';
import 'package:present_app/screens/signup_screen.dart';
import 'package:present_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  static const routeName = '/login-screen';
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
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontSize: 18,
                          color: MyColors.myGray,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      AuthCard(),
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

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
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
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false)
          .login(
        _authData['email'],
        _authData['password'],
      )
          .then((value) {
        if (value == true) {
          Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
        }
      });
    } on HttpException catch (error) {
      var errorMessage = 'فشل الاتصال بالسيرفر';
      if (error.toString().contains('Unauthorised')) {
        errorMessage = 'خطأ في الايميل او كلمة المرور';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'فشل الاتصال بالشبكة الرجاء التأكد من الانترنت و المحاولة مرة اخرى';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[20],
                  contentPadding: const EdgeInsets.all(2),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.myGreen),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.myWhite),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: ' الايميل',
                  labelStyle: TextStyle(color: MyColors.myGreen)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty || !value.contains('@')) {
                  return 'الايميل غير صحيح !';
                }
                return null;
              },
              onSaved: (value) {
                _authData['email'] = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[20],
                  contentPadding: const EdgeInsets.all(2),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyColors.myGreen),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.myWhite),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: ' كلمة المرور',
                  labelStyle: TextStyle(color: MyColors.myGreen)),
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value.isEmpty || value.length < 5) {
                  return 'كلمة المرور قصيرة !';
                }
                return null;
              },
              onSaved: (value) {
                _authData['password'] = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(right: 0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ForgotPasswordScreen.routeName);
                },
                child: const Text(
                  "نسيت كلمة السر ؟",
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColors.myGreen,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (_isLoading)
              CircularProgressIndicator()
            else
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MaterialButton(
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      color: MyColors.myGreen,
                      textColor: Colors.white,
                      onPressed: _submit,
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "  ليس لديك حساب ؟",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(SignupScreen.routeName);
                },
                child: const Text(
                  "  انشاء حساب",
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColors.myGreen,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
