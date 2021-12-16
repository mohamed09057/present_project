import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:present_app/models/subject_lecture.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectAttendances with ChangeNotifier {
  List<SubjectLecture> _items = [];

  List<SubjectLecture> get items {
    return [..._items];
  }

  Future<void> fetchAndSetSubjectAttendances(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    String token1 = extractedUserData['token'];
    var studentId = extractedUserData['userId'];
    final url =
        Uri.parse('https://attendapplication.000webhostapp.com/api/subjectLectures/$id');
    final url1 =
        Uri.parse('https://attendapplication.000webhostapp.com/api/attendances');
        
    try {
      final response = await http.get(url, headers: {
        "Authorization": "Bearer $token1",
        "Accept": "application/json",
      });
      print(response.body);
      final response1 = await http.get(url1, headers: {
        "Authorization": "Bearer $token1",
        "Accept": "application/json",
      });
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final extractedData1 = json.decode(response1.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      if (extractedData1 == null) {
        return;
      }
      final List<SubjectLecture> loadedData = [];
      String status='غياب';
      for (int i = 0; i < extractedData["data"].length; i++) {
        for (int j = 0; j < extractedData1["data"].length; j++) {
        if((extractedData["data"][i]["id"].toString()==extractedData1["data"][j]["lecture_id"].toString())&&(studentId==extractedData1["data"][j]["student_id"].toString())){
           status='حضور';
        }}
        loadedData.add(
          SubjectLecture(
            id: extractedData["data"][i]["id"].toString(),
            status: status,
            date: extractedData["data"][i]["created_at"],
          ),
        );
        status='غياب';
      }
      
      print(extractedData);
      _items = loadedData;
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
