


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nekonapp/domain/datasources/models/pomodoro_model.dart';
import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/domain/datasources/pomodoro_datasource.dart';

class FirebasePomodoroDatasourceImpl extends PomodoroDataSource{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionPath = 'pomodoros';

  @override
  Future<List<PomodoroModel>> getAllPomodorosByUser(UserId userId) async {
    final snapShots = await firestore.collection(collectionPath).where('user_id', isEqualTo: userId).get();
    final snapShotsToList = snapShots.docs.map((doc) => PomodoroModel.fromJson(doc.data()) ).toList();
    return snapShotsToList;
    
  }

  @override
  Future<void> savePomodoro(PomodoroModel pomodoro) async{
    final pomodorosCollection = firestore.collection(collectionPath);
    await pomodorosCollection.add(pomodoro.toJson());
    throw UnimplementedError();
  }

  @override
  Future<void> updatePomodoro(PomodoroId pomodoroId, PomodoroModel pomodoro) async{
    final pomodoroCollection = firestore.collection(collectionPath);
    await pomodoroCollection.doc(pomodoroId).update(pomodoro.toJson());
    
    throw UnimplementedError();
  }

}