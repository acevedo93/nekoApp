import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/auth_result_model.dart';
import 'package:nekonapp/presentation/state/auth/providers/auth_state_provider.dart';

final isErrorProvider = Provider<AuthResult?>((ref) {
  final result = ref.watch(authStateProvider).result;
  if(result.status == AuthResultStatus.failure){
    return result;
  }
  return null;
});
