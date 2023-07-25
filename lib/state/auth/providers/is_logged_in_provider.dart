

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/state/auth/models/auth_result.dart';
import 'package:nekonapp/state/auth/providers/auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authProvider = ref.watch(authStateProvider);
  return authProvider.result == AuthResult.success;
});