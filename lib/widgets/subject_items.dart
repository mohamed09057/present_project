import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class SubjectItem extends StatelessWidget {
   final String name;
  final int countAttendance;
  final int allttendance;

  const SubjectItem({Key key, this.name, this.countAttendance, this.allttendance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double colorr=(countAttendance/allttendance)*(100);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(width: 1, color: MyColors.myGreen),
        children: [
          TableRow(
            children: [
              Center(
                child: Text(name),
              ),
               Center(
                child: Text(allttendance.toString()),
              ),
              Center(
                child: Text(countAttendance.toString()),
              ),
              Center(
                child: Text(((countAttendance/allttendance)*(100)).toString()+"%"),
              ),
              Center(
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: colorr<=40.0?Colors.red[600]:colorr>40.0&&colorr<=60.0?Colors.yellow[600]:Colors.green[600],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
