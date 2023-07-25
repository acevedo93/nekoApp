import 'package:firebase_auth/firebase_auth.dart';
import 'package:nekonapp/domain/datasources/models/user_model.dart';



abstract class UserDatasource {
  Future<UserModel> getUserById(String userId);
  Future<void> saveUser(UserModel user);
  Future<void> updateUser(UserModel user);
}
