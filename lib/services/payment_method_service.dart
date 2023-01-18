import 'dart:convert';

import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/services/auth_services.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethod() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
          Uri.parse(
            '$baseUrl/api/payment_methods',
          ),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode == 200) {
        print(res.body);
        return List<PaymentMethodModel>.from(jsonDecode(res.body).map(
                (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
