import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/user_settings_model.dart';
import 'package:nekonapp/presentation/state/user/provider/user_state_provider.dart';

final settingsProvider = Provider<UserSettingsModel?>((ref) {
  final settings = ref.watch(userStateProvider).settings;
  return settings;
});


