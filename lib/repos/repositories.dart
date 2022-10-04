import 'dart:convert';

import "package:http/http.dart" as http;

import '../models/user_model.dart';

class UserRepository {
  String endpoint = "https://reqres.in/api/users?page=2";

  Future getUsers() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)["data"];
      /**Convertimos a un objeto a Lista */
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
