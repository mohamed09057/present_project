import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:present_app/models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  String _userName;
  String _userEmail;
  String _stdNum;
  bool success = false;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<bool> signup(String name, String email, String studentNumber,
      String password, String cPassword) async {
    final url = Uri.parse('https://attendapplication.000webhostapp.com/api/register');
    try {
      final response = await http.post(url, body: {
        "name": name,
        "email": email,
        "password": password,
        "student_number": studentNumber,
        "c_password": cPassword,
      });
      final responseData = json.decode(response.body);
      if (responseData['data']['error'] != null) {
        throw HttpException(responseData['data']['error']);
      }
      success = true;
      _token = responseData['data']['token'].toString();
      _userId = responseData['data']['id'].toString();
      _userName = responseData['data']['name'].toString();
      _userEmail = responseData['data']['email'].toString();
      _stdNum = responseData['data']['student_number'].toString();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'userName': _userName,
          'userEmail': _userEmail,
          'stdNum': _stdNum
        },
      );
      prefs.setString('userData', userData);
      return success;
    } catch (error) {
      throw error;
    }
  }

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('https://attendapplication.000webhostapp.com/api/login');
    try {
      final response = await http.post(url,headers: {
        "Accept":"application/json",
        "Charset":"utf-8"
      }, body: {
        "email": email,
        "password": password,
      });
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['data']['error'] != null) {
        throw HttpException(responseData['data']['error']);
      }
      success = true;
      _token = responseData['data']['token'].toString();
      _userId = responseData['data']['id'].toString();
      _userName = responseData['data']['name'].toString();
      _userEmail = responseData['data']['email'].toString();
      _stdNum = responseData['data']['student_number'].toString();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'userName': _userName,
          'userEmail': _userEmail,
          'stdNum': _stdNum
        },
      );
      prefs.setString('userData', userData);
      return success;
    } catch (error) {
      throw error;
    }
  }

  Future<bool> editProfile(String name, String email, String studentNumber,
      String password, String token, String id) async {
    final url = Uri.parse('https://attendapplication.000webhostapp.com/api/update/$id');
    try {
      final response = await http.put(url, body: {
        "name": name,
        "email": email,
        "password": password,
        "student_number": studentNumber,
      }, headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });
      final responseData = json.decode(response.body);
      print(name);
      print(responseData);
      if (responseData['data']['error'] != null) {
        throw HttpException(responseData['data']['error']);
      }
      success = true;
      _userName = responseData['data']['name'].toString();
      _userEmail = responseData['data']['email'].toString();
      _stdNum = responseData['data']['student_number'].toString();
      final prefs = await SharedPreferences.getInstance();
      final extractedUserData =
          json.decode(prefs.getString('userData')) as Map<String, Object>;

      final userData = json.encode(
        {
          'token': extractedUserData['token'],
          'userId': extractedUserData['userId'],
          'userName': _userName,
          'userEmail': _userEmail,
          'stdNum': _stdNum
        },
      );
      prefs.clear();
      prefs.setString('userData', userData);

      return success;
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _stdNum = extractedUserData['stdNum'];
    _userEmail = extractedUserData['userEmail'];
    _userName = extractedUserData['userName'];
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _stdNum = null;
    _userName = null;
    _userEmail = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');

    prefs.clear();
  }

  Future<bool> attendance(String lectureId) async {
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
        String userid = extractedUserData['userId'];
    String token1 = extractedUserData['token'];
    final url = Uri.parse('https://attendapplication.000webhostapp.com/api/attendance');
    try {
      final response = await http.post(url, body: {
        "status": "true",
        "lecture_id": lectureId,
        "student_id": userid
      }, headers: {
        "Authorization": "Bearer $token1",
        "Accept": "application/json",
      });
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['data']['error'] != null) {
        throw HttpException(responseData['data']['error']);
      }
      success=true;
      notifyListeners();
      return  success;
    } catch (error) {
      throw error;
    }
  }

  
  
}
