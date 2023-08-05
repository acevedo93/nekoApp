import 'package:nekonapp/domain/datasources/models/user_settings_model.dart';

import '../../../domain/datasources/models/user_model.dart';

class UserState {
  final bool isLoading;
  final UserModel? currentUser;
  final UserSettingsModel? settings;

  const UserState(
      {required this.isLoading, required this.currentUser, this.settings});

  UserState copiedWithIsLoading(bool isLoading) => UserState(
      currentUser: currentUser,
      isLoading: isLoading,
      settings: settings);
  UserState copyWith({bool? isLoading, UserModel? currentUser,
          UserSettingsModel? settings}) =>
      UserState(
          isLoading: isLoading ?? this.isLoading,
          currentUser: currentUser ?? this.currentUser,
          settings: settings ?? this.settings);
}
