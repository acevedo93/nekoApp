import 'package:nekonapp/domain/datasources/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUserById(String userId);
  Future<void> saveUser(UserModel user);
  Future<void> updateUser(UserModel user);
}
