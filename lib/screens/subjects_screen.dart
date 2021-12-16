// ignore_for_file: file_names
import 'package:present_app/providers/student_subjects.dart';
import 'package:present_app/screens/subjects_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class SubjectsScreen extends StatefulWidget {
  static const routeName = '/subjects-screen';
  const SubjectsScreen({Key key}) : super(key: key);

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Subjects>(context).fetchAndSetSubjects().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final subjectdata = Provider.of<Subjects>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myGreen,
          elevation: 0.0,
          title: Text(' تقارير المواد'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(" اختار مادة : ",
                  style: TextStyle(
                      fontSize: 20,
                      color: MyColors.myGray,
                      fontWeight: FontWeight.bold)),
            ),
           _isLoading?Expanded(child: Center(child: CircularProgressIndicator(color: MyColors.myGreen,),),):
            Expanded(
              child: ListView.builder(
                itemCount: subjectdata.items.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.report),
                        SizedBox(width: 5,),
                          Text(
                          subjectdata.items[i].name,
                        ),
                      SizedBox(width: 5,),
                        Text(
                          " أ."+" ${subjectdata.items[i].teatcherName}",
                          style: TextStyle(
                           color: MyColors.myGray
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    color: MyColors.myGreen,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.of(context).pushNamed(SubjecDetailseScreen.routeName,arguments: subjectdata.items[i].id);
                    }
                  ),
                ),
                Divider()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
