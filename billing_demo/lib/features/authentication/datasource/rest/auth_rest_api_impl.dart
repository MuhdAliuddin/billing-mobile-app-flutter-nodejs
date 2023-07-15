import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../entities/access_token.dart';
import '../../../../entities/user.dart';
import 'auth_rest_api.dart';

class AuthenticationRestApiImpl implements AuthenticationRestApi {
  final http.Client client;
  final String url = dotenv.env['API_URL'] ?? '';
  final Options options = Options(headers: {
    "Content-Type": "application/json",
  });

  AuthenticationRestApiImpl({required this.client});

  @override
  Future<AccessToken>? login(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (username == 'a') {
      var response = await Dio().get(
        '$url/users/1',
        options: options,
      );

      return AccessToken(
        token: "djsUhsjjLLsicxs8JnsN",
        ttl: 10000,
        user: User(
          id: response.data['id'].toString(),
          email: response.data['email'].toString(),
          name: response.data['name'].toString(),
          phoneNum: response.data['phone_num'].toString(),
          expiredDate: response.data['exp_date'].toString(),
          planType: response.data['plan_type'].toString(),
        ),
      );
    }
    return const AccessToken(
      token: "djsUhsjjLLsiii98JnsN",
      ttl: 10000,
      user: User(
        id: "random-1",
        email: "inspector@majlis.com",
        name: "Muhammad Aliuddin",
        phoneNum: "012-011292377",
        staffId: "1011",
        icNum: "222",
        expiredDate: "2023-08-01 17:00:00.000000",
        planType: "Unlimited",
      ),
      userId: 'random-1',
    );
  }

  @override
  Future<AccessToken>? logout() async {
    await Future.delayed(const Duration(milliseconds: 10));
    return const AccessToken();
  }
}
