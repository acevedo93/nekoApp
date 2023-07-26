

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/auth/providers/auth_state_provider.dart';
import '../../../../domain/datasources/models/auth_result_model.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final result = ref.watch(authStateProvider).result;
  return result.status == AuthResultStatus.success;
});