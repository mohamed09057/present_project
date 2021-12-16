import 'package:flutter/foundation.dart';

class MyDetail with ChangeNotifier {
  final String name;
  final int countAttendance;
  final int allttendance;
  


  MyDetail({
    @required this.name,
    @required this.countAttendance,
     @required this.allttendance,
  });
}
