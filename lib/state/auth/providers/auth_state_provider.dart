


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/state/auth/notifiers/auth_state_notifier.dart';
import '../auth_state.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((_) => AuthStateNotifier());

//we can make another providers with small pieces