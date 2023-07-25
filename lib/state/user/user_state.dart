


import '../../domain/datasources/models/user_model.dart';

class UserState {
  final bool isLoading;
  final UserModel? currentUser;


  const UserState({
    required this.isLoading,
    required this.currentUser
  });

  UserState copiedWithIsLoading(bool isLoading) => UserState(currentUser: this.currentUser, isLoading: isLoading);
  UserState copyWith(bool? isLoading, UserModel? currentUser ) => UserState(isLoading: isLoading ?? this.isLoading, currentUser: currentUser ?? this.currentUser)
  
}