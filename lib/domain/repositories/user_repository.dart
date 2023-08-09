import 'dart:ui';

import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/domain/datasources/models/user_settings_model.dart';

abstract class UserRepository {
  Future<UserModel> getUserById(String userId);
  Future<void> saveUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<UserSettingsModel> getSettingsById(String userId);
  Future<void> updateSettingsById(String userId, UserSettingsModel settings);

}
