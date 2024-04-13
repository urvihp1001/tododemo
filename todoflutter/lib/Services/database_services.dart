import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoflutter/models/task.dart';
import 'globals.dart';

class DatabaseServices {
  static Future<Task> addTask(String title) async {
    Map data = {
      "title": title,
    };
    var body = json.encode(data);
    var url = Uri.parse('$baseURL/add');

    try {
      http.Response response = await http.post( 
        url,
        headers: headers,
        body: body,
      );
      
      if (response.statusCode == 200) {
        Map responseMap = jsonDecode(response.body);
        Task task = Task.fromMap(responseMap);
        return task;
      } else {
        // Handle other status codes (e.g., 404, 500) appropriately
        throw Exception('Failed to add task: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or exceptions
      throw Exception('Failed to add task: $e');
    }
  }

  static Future<List<Task>> getTasks() async {
    var url = Uri.parse(baseURL);

    try {
      http.Response response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        List responseList = jsonDecode(response.body);
        List<Task> tasks = responseList.map((taskMap) => Task.fromMap(taskMap)).toList();
        return tasks;
      } else {
        // Handle other status codes (e.g., 404, 500) appropriately
        throw Exception('Failed to fetch tasks: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or exceptions
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  static Future<http.Response> updateTask(int id) async {
    var url = Uri.parse('$baseURL/update/$id');

    try {
      http.Response response = await http.put(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        // Handle other status codes (e.g., 404, 500) appropriately
        throw Exception('Failed to update task: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or exceptions
      throw Exception('Failed to update task: $e');
    }
  }

  static Future<http.Response> deleteTask(int id) async {
    var url = Uri.parse('$baseURL/delete/$id');

    try {
      http.Response response = await http.delete(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        // Handle other status codes (e.g., 404, 500) appropriately
        throw Exception('Failed to delete task: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or exceptions
      throw Exception('Failed to delete task: $e');
    }
  }
}
