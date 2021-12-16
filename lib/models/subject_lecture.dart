import 'package:flutter/foundation.dart';

class SubjectLecture with ChangeNotifier {
  final String id;
  final String status;
  final String date;

  SubjectLecture({
    @required this.id,
    @required this.status,
     this.date
  });
}
