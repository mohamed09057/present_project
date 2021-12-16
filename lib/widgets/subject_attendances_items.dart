import 'package:flutter/material.dart';
import 'package:present_app/conistants/my_colors.dart';

class SubjectAttendancesItem extends StatelessWidget {
  final String id;
  final String status;
  final String date;

  const SubjectAttendancesItem({Key key, this.id, this.status, this.date}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder.all(width: 1, color: MyColors.myGreen),
        children: [
          TableRow(
            children: [
              Center(child: Text(id.toString(),style: TextStyle(fontSize: 13))),
              Center(child: Text(status.toString(),style: TextStyle(fontSize: 13))),
              date!=null&&status=='حضور'?Center(child: Text(DateTime.parse(date).year.toString()+" - "+DateTime.parse(date).month.toString()+" - "+DateTime.parse(date).day.toString(),style: TextStyle(fontSize: 13),)):Center(child: Text('')),
               date!=null&&status=='حضور'?Center(child: Text(DateTime.parse(date).second.toString()+" : "+DateTime.parse(date).minute.toString()+" : "+DateTime.parse(date).hour.toString(),style: TextStyle(fontSize: 13))):Center(child: Text('')),

            ],
          ),
        ],
      ),
    );
  }
}
