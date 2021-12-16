// ignore_for_file: file_names
import 'package:present_app/providers/my_details.dart';
import 'package:present_app/screens/home_page_screen.dart';
import 'package:present_app/widgets/main_drawer.dart';
import 'package:present_app/widgets/subject_items.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class DetailseScreen extends StatefulWidget {
  static const routeName = '/detaiels-screen';

  const DetailseScreen({Key key}) : super(key: key);

  @override
  State<DetailseScreen> createState() => _DetailseScreenState();
}

class _DetailseScreenState extends State<DetailseScreen> {
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
      Provider.of<MyDetails>(context).fetchAndSetDetailsAttendances().then((_) {
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
    final detailsData = Provider.of<MyDetails>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: MyColors.myGreen,
          elevation: 0.0,
          title: Text(' تفاصيلي الدراسية'),
          centerTitle: true,
        ),
        body: Column(
          
          children: <Widget>[
            SizedBox(
              height: 130,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomShape(),
                    child: Container(
                      height: 150,
                      color: MyColors.myGreen,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Table(
                border: TableBorder.all(width: 1, color: MyColors.myGreen),
                
                children: [
                  TableRow(
                    
                    children: [
                      Center(
                          child: Text("اسم المادة",style: TextStyle( color: MyColors.myGreen,fontWeight: FontWeight.bold),),
                        ),
                        Center(
                          child: Text("عدد المحاضرات ",style: TextStyle(color: MyColors.myGreen,fontWeight: FontWeight.bold),),
                        ),
                       Center(
                          child: Text("مرات الحضور ",style: TextStyle(color: MyColors.myGreen,fontWeight: FontWeight.bold),),
                        ),
                       Center(
                          child: Text("نسبة الحضور",style: TextStyle(color: MyColors.myGreen,fontWeight: FontWeight.bold),),
                        ),
                       Center(
                          child: Text(" الموقف",style: TextStyle(color: MyColors.myGreen,fontWeight: FontWeight.bold),),
                        ),
                      
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
                      itemCount: detailsData.items.length,
                      itemBuilder: (_, i) => Column(
                        children: [
                          SubjectItem(
                            name: detailsData.items[i].name,
                            countAttendance: detailsData.items[i].countAttendance,
                            allttendance: detailsData.items[i].allttendance,
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
