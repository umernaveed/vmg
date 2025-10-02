import 'package:we_ship_faas/data/models/user/user.dart';

abstract class LocalRepository {
  Future<bool> saveUser(User user);
  Future<User> getUser();
  Future<bool> deleteUser();
  Future<String> getAccessToken();
  Future<String> getLoginToken();
  Future<void> loggedIN({bool isLoggedIn = true});
  Future<bool> isLoggedIn();
  User getInstantUser();
}
