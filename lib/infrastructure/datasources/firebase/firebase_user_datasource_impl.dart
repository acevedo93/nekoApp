
import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/domain/datasources/user_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserDataSourceImpl extends UserDatasource {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionPath = 'users';

  @override
  Future<UserModel> getUserById(String userId) async {
    final userDocument = firestore.collection(collectionPath).doc(userId);
    final user = await userDocument.get().then((value) => UserModel.fromJson(value.data()));
    return user;
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final userDocument = firestore.collection(collectionPath).doc(user.id);
    await userDocument.set(user.toJson());
  }

  @override
  Future<void> updateUser(UserModel user) async {
       final userDocument = firestore.collection('users').doc('123');
    await userDocument.update(user.toJson());
  }

}