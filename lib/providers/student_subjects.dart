import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:present_app/models/student_subject.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Subjects with ChangeNotifier {
  List<Subject> _items = [];

  List<Subject> get items {
    return [..._items];
  }

  Subject findById(String id) {
    return _items.firstWhere((subject) => subject.id == id);
  }

  Future<void> fetchAndSetSubjects() async {
    print("object");
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    var id = extractedUserData['userId'];
    String token1 = extractedUserData['token'];
    final url = Uri.parse('https://attendapplication.000webhostapp.com/api/studentSubjects/$id');
    final url1 = Uri.parse('https://attendapplication.000webhostapp.com/api/teachers');

    try {
      final response = await http.get(url, headers: {
        "Authorization": "Bearer $token1",
        "Accept": "application/json",
      });
       final response1 = await http.get(url1, headers: {
        "Authorization": "Bearer $token1",
        "Accept": "application/json",
      });
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final extractedData1 = json.decode(response1.body) as Map<String, dynamic>;

      print(extractedData);
      print(extractedData1);
    
      if (extractedData == null) {
        return;
      }
      if (extractedData1 == null) {
        return;
      }
      final List<Subject> loadedSubjects = [];
      String teatcherName='';

      for (int i = 0; i < extractedData["data"].length; i++) {
        for (int j = 0; j < extractedData1["data"].length; j++) {
             if(extractedData["data"][i]["user_id"].toString()==extractedData1["data"][j]["id"].toString()){
               teatcherName=extractedData1["data"][j]["name"];
             }
        }
        loadedSubjects.add(
          Subject(
            id: extractedData["data"][i]["id"].toString(),
            name: extractedData["data"][i]["name"],
            teatcherId: extractedData["data"][i]["user_id"],
            teatcherName: teatcherName,
          ),
        );
        teatcherName='';
      }
      _items = loadedSubjects;
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
