import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:present_app/models/my_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDetails with ChangeNotifier {
  List<MyDetail> _items = [];

  List<MyDetail> get items {
    return [..._items];
  }

  Future<void> fetchAndSetDetailsAttendances() async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    String token1 = extractedUserData['token'];
    var studentId = extractedUserData['userId'];
    
    final url =
        Uri.parse('https://attendapplication.000webhostapp.com/api/studentSubjects/$studentId');
    final url1 =
        Uri.parse('https://attendapplication.000webhostapp.com/api/studentLectures/$studentId');
        final url2 =
        Uri.parse('https://attendapplication.000webhostapp.com/api/allLectures');
        
    try {
      final response = await http.get(url, headers: {
        "Authorization": "Bearer $token1",
        "Accept": "application/json",
      });
      final response1 = await http.get(url1, headers: {
        "Authorization": "Bearer $token1",
        "Accept": "application/json",
      });
      final response2 = await http.get(url2, headers: {
        "Authorization": "Bearer $token1",
        "Accept": "application/json",
      });
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final extractedData1 = json.decode(response1.body) as Map<String, dynamic>;
      final extractedData2 = json.decode(response2.body) as Map<String, dynamic>;
      print(extractedData2);
      if (extractedData == null) {
        return;
      }
      if (extractedData1 == null) {
        return;
      }
      if (extractedData2 == null) {
        return;
      }
      final List<MyDetail> loadedData = [];
      int stdAttend=0;
      int allAttend=0;
      for (int i = 0; i < extractedData["data"].length; i++) {
        for (int j = 0; j < extractedData1["data"].length; j++) {
        if(extractedData["data"][i]["id"].toString()==extractedData1["data"][j]["subject_id"].toString()){
           stdAttend=stdAttend+1;
        }}

        for (int k = 0; k < extractedData2["data"].length; k++) {
          print(extractedData2["data"][k]["id"]);
        if(extractedData["data"][i]["id"].toString()==extractedData2["data"][k]["subject_id"].toString()){
           allAttend=allAttend+1;
        }}


        loadedData.add(
          MyDetail(
            name: extractedData["data"][i]["name"].toString(),
            countAttendance: stdAttend,
            allttendance: allAttend,
          ),
        );
        stdAttend=0;
        allAttend=0;
      }
      
      _items = loadedData;
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
