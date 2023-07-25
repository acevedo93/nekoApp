import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/domain/datasources/user_datasource.dart';
import 'package:nekonapp/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{

  final UserDatasource datasource;

  UserRepositoryImpl({
    required this.datasource
  });


  @override
  Future<UserModel> getUserById(String userId) {
    return datasource.getUserById(userId);
  }


  @override
  Future<void> saveUser(UserModel user) {
    return datasource.saveUser(user);
  }

  @override
  Future<void> updateUser(UserModel user) {
    return datasource.updateUser(user);
  }

}