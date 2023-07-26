import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/user/provider/user_state_provider.dart';

final isLoadingProvider = Provider<bool>((ref) =>
  ref.watch(userStateProvider).isLoading
);