import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/state/user/notifiers/user_state_notifier.dart';
import 'package:nekonapp/state/user/user_state.dart';

final userStateProvider = StateNotifierProvider<UserStateNotifier, UserState>((ref) => UserStateNotifier());