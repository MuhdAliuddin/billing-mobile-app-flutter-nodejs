import '../../../../entities/access_token.dart';
import '../../../../entities/user.dart';

abstract class AuthenticationDriftApi {
  Future<int?> create({required AccessToken accessToken});
  Future<AccessToken?> findOne();
  Future<int> destroy();
  Future<User?> findInspector();
  //Future<int?> set({required Inspector inspector});
}
