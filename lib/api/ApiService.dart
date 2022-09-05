import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.32.61.96:8080";

  Future<List<dynamic>> getAllStudent() async {
    try {
      var url = Uri.parse("$baseUrl/student/");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> getStudentName(name) async {
    try {
      var url = Uri.parse("$baseUrl/student/findStudent/$name");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> editStudent(id, teams) async {
    try {
      var url = Uri.parse("$baseUrl/student/editStudent/$id");
      var response = await http.put(url,
          body: jsonEncode({"teams": teams}),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load update');
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> createStudent(name, email, gender, teams) async {
    try {
      var url = Uri.parse("$baseUrl/student/addStudent");
      var body = {
        "name": name,
        "email": email,
        "gender": gender,
        "team": teams
      };
      print(jsonEncode(body));
      var response = await http.post(url,
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      return [];
    }
  }
}
