import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_list_flutter/domain/models/user.dart';

class NetworkService {
  final _baseUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<User>> getUsers() async {
    final url = Uri.parse(_baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJcon(json)).toList();
    } else {
      throw Exception("Error");
    }
  }
}
