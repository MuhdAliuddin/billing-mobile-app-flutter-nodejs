import '../../../../entities/access_token.dart';

abstract class AuthenticationRestApi {
  Future<AccessToken>? login(String username, String password);
  Future<AccessToken>? logout();
}
