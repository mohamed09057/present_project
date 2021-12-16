// ignore_for_file: file_names
import 'package:present_app/providers/student_subjects.dart';
import 'package:present_app/providers/subject_attendances.dart';
import 'package:present_app/widgets/subject_attendances_items.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class SubjecDetailseScreen extends StatefulWidget {
  static const routeName = '/subject-detaiels-screen';
  const SubjecDetailseScreen({Key key}) : super(key: key);

  @override
  State<SubjecDetailseScreen> createState() => _SubjecDetailseScreenState();
}

class _SubjecDetailseScreenState extends State<SubjecDetailseScreen> {
  var _isInit = true;

  var _isLoading = false;
  String subjectId = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    subjectId = ModalRoute.of(context).settings.arguments as String;

    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<SubjectAttendances>(context)
          .fetchAndSetSubjectAttendances(subjectId)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      }
      );
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final subject = Provider.of<Subjects>(context).findById(subjectId);
    final subAttendsData = Provider.of<SubjectAttendances>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myGreen,
          elevation: 0.0,
          title: Text('  التقارير'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(" تقرير مادة : " + subject.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: MyColors.myGray,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Table(
                border: TableBorder.all(width: 1, color: MyColors.myGreen),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Center(
                          child: Text(
                        "رقم المحاضرة",
                        style: TextStyle(
                            color: MyColors.myGreen,
                            fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        " الحالة ",
                        style: TextStyle(
                            color: MyColors.myGreen,
                            fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        "التاريخ",
                        style: TextStyle(
                            color: MyColors.myGreen,
                            fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        " الزمن",
                        style: TextStyle(
                            color: MyColors.myGreen,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            _isLoading
                ? Expanded(
                    child: Center(
                    child: CircularProgressIndicator(
                      color: MyColors.myGreen,
                    ),
                  ))
                : Expanded(
                    child: ListView.builder(
                      itemCount: subAttendsData.items.length,
                      itemBuilder: (_, i) => Column(
                        children: [
                          SubjectAttendancesItem(
                            id: subAttendsData.items[i].id,
                            status: subAttendsData.items[i].status,
                            date: subAttendsData.items[i].date,
                          ),
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