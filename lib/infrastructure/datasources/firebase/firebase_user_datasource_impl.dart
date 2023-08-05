import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/domain/datasources/models/user_settings_model.dart';
import 'package:nekonapp/domain/datasources/user_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserDataSourceImpl extends UserDatasource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionPathUsers = 'users';
  String collectionPathSettings = 'settings';

  @override
  Future<UserModel> getUserById(String userId) async {
    final userDocument = firestore.collection(collectionPathUsers).doc(userId);
    final user = await userDocument
        .get()
        .then((value) => UserModel.fromJson(value.data()));
    return user;
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final userDocument = firestore.collection(collectionPathUsers).doc(user.id);
    await userDocument.set(user.toJson());
  }

  @override
  Future<void> updateUser(UserModel user) async {
    final userDocument = firestore.collection(collectionPathUsers).doc('123');
    await userDocument.update(user.toJson());
  }

  @override
  Future<UserSettingsModel> getSettingsById(String userId) async {
    print(userId);
    final userDocument = firestore.collection(collectionPathUsers).doc(userId);
    final settingsSnapShot =
        await userDocument.collection(collectionPathSettings).limit(1).get();
    return UserSettingsModel.fromJson(settingsSnapShot.docs.first.data());
    // throw UnimplementedError();
  }

  @override
  Future<void> updateSettingsById(String userId, UserSettingsModel settings) {
    throw UnimplementedError();
  }
}
