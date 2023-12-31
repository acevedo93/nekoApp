import '../../../domain/datasources/models/auth_result_model.dart';
import '../../../domain/datasources/models/user_model.dart';

class AuthState {
  final AuthResult result;
  final bool isLoading;
  final UserId? userId;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userId
  });

  AuthState.unknown()
      : result = AuthResult(status: AuthResultStatus.aborted),
        isLoading = false,
        userId = null;

  AuthState copiedWithIsLoading(bool isLoading) =>
      AuthState(result: result, isLoading: isLoading, userId: userId);

  AuthState copyWith(UserId? userId, bool? isLoading, AuthResult? result) =>
      AuthState(
          isLoading: isLoading ?? this.isLoading,
          userId: userId ?? this.userId,
          result: result ?? this.result);

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  @override
  int get hashCode => Object.hash(result, isLoading, userId);
}
