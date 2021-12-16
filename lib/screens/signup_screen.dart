import 'package:present_app/conistants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:present_app/models/http_exception.dart';
import 'package:present_app/providers/auth.dart';
import 'package:present_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
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
        backgroundColor: MyColors.myWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                          "انشاء حساب",
                          style: TextStyle(
                            fontSize: 18,
                            color: MyColors.myGray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
            ),
                      
            Expanded(
              child: LayoutBuilder(
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
                        child: 
                            
                            
                            AuthCard(),
                          
                          
                        
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
    'name': '',
    'email': '',
    'password': '',
    'student_number': '',
    'c_password':''
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

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
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['name'],
          _authData['email'],
          _authData['student_number'],
          _authData['password'],
          _authData['c_password'],
        ).then((value) {
          if(value==true){
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }
        });
      // ignore: unused_catch_clause
      } on HttpException catch (error) {
      var errorMessage = 'فشل الاتصال بالسيرفر';
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'فشل الاتصال بالشبكة الرجاء التأكد من الانترنت و المحاولة مرة اخرى';
      
      if(error.toString().contains("FormatException: Unexpected character (at character 1)")){
      const errorMessage =
          'الايميل مستخدم مسبقا !';
      _showErrorDialog(errorMessage);
    }
    _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return    SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
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
                    labelText: 'الاسم',labelStyle: TextStyle(color: MyColors.myGreen)),
                  
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'الاسم مطلوب';
                    }if (value.isEmpty || value.length < 5) {
                      return '  اسم الطالب يجب ان يكون من خانتين على الاقل !';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    _authData['name'] = value;
                  },
                ),
                SizedBox(height: 10,),
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
                    labelText: 'الايميل',labelStyle: TextStyle(color: MyColors.myGreen)),
                  
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
                SizedBox(height: 10,),
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
                    labelText: 'الرقم الجامعي',labelStyle: TextStyle(color: MyColors.myGreen)),
                  
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'الرقم الجامعي مطلوب';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['student_number'] = value;
                  },
                ),
                SizedBox(height: 10,),
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
                    labelText: 'كلمة المرور',labelStyle: TextStyle(color: MyColors.myGreen)),
                  
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
                SizedBox(height: 10,),
                  TextFormField(
                    enabled: true,
                    decoration: InputDecoration( filled: true,
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
                    labelText: 'اعادة كلمة المرور',labelStyle: TextStyle(color: MyColors.myGreen),),
                    obscureText: true,
                    validator: 
                         (value) {
                            if (value != _passwordController.text) {
                              return 'كلمتا المرور غير متطابقتان !';
                            }
                            return null;
                            },
                            onSaved: (value) {
                    _authData['c_password'] = value;
                  },
                          
                        
                  ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                 Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        MaterialButton(
                          
                          child: Text(
                            'تسجيل ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          color: MyColors.myGreen,
                          textColor: Colors.white,
                        onPressed: 
                          _submit
                        ,
                      ),
                      SizedBox(height: 20,)
              ],
                ),),

              ],
            ),
          ),
        
      );
    
  }
}
