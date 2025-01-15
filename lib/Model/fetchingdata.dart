import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/Model/modleforjsonformate.dart';

class ApiProvider with ChangeNotifier {
  ApiResponse? _data;

  ApiResponse? get data => _data;

  Future<void> fetchData() async {
    final url = Uri.parse("https://api.mocklets.com/p6764/test_mint");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      _data = ApiResponse.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
