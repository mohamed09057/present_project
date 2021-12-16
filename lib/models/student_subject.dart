import 'package:flutter/foundation.dart';

class Subject with ChangeNotifier {
  final String id;
  final String name;
  final int teatcherId;
  final String teatcherName;

  Subject({
    @required this.id,
    @required this.name,
    @required this.teatcherId,
    @required this.teatcherName
  });
}
