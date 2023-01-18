import 'dart:convert';

import 'package:bank_sha/models/top_up_form_model.dart';
import 'package:bank_sha/services/auth_services.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopUpFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
          Uri.parse(
            '$baseUrl/api/top_ups',
          ),
          body: data.toJson(),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
