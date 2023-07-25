import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/state/auth/providers/auth_state_provider.dart';

final isLoadingProvider = Provider<bool>((ref) =>
  ref.watch(authStateProvider).isLoading
);