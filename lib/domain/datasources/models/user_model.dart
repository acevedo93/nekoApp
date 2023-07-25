import 'package:equatable/equatable.dart';
import 'package:nekonapp/state/auth/models/user_id.dart';

enum Genre {
  masculine,
  femenine
}

class UserModel extends Equatable {

  final UserId id;
  final String name;
  final String email;
  final String createdAt;
  final Genre genre;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.genre,
    required this.createdAt
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) => UserModel(
    id: json?['id'],
    name: json?['name'],
    email: json?['email'],
    genre: json?['genre'],
    createdAt: json?['created_at']
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "created_at": createdAt,
        "genre": genre,
      };  

  @override
  List<Object> get props => [id, name, email, genre, createdAt];
}