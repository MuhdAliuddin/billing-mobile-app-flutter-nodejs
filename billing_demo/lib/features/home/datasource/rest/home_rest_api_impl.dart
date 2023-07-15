import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../domain/invoice_model.dart';
import 'home_rest_api.dart';

class HomeRestApiImpl implements HomeRestApi {
  final http.Client client;
  final String url = dotenv.env['API_URL'] ?? '';
  final Options options = Options(headers: {
    "Content-Type": "application/json",
  });

  HomeRestApiImpl({required this.client});

  @override
  Future<List<Invoice>> getMonthlyInvoice({
    required String id,
  }) async {
    var response = await Dio().get(
      '$url/billings',
      options: options,
    );

    // var response = [
    //   {
    //     "id": "100",
    //     "amount": 68,
    //     "month": 01,
    //     "status": 00,
    //   },
    //   {
    //     "id": "100",
    //     "amount": 60,
    //     "month": 02,
    //     "status": 00,
    //   },
    //   {
    //     "id": "100",
    //     "amount": 63,
    //     "month": 03,
    //     "status": 00,
    //   },
    //   {
    //     "id": "100",
    //     "amount": 68,
    //     "month": 04,
    //     "status": 00,
    //   },
    //   {
    //     "id": "100",
    //     "amount": 55,
    //     "month": 05,
    //     "status": 01,
    //   },
    // ];
    jsonEncode(response.data);
    List<Invoice> list = response.data
        .map<Invoice>(
          (json) => Invoice(
            id: json['id'].toString(),
            amount: json['amount'].toString(),
            month: json['month'].toString(),
            status: int.parse(
              json['status'].toString(),
            ),
          ),
        )
        .toList();

    return list;
  }
}
