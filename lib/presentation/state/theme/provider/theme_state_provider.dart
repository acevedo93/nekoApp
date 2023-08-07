

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/theme/notifier/theme_state_notifier.dart';
import 'package:nekonapp/presentation/state/theme/theme_state.dart';

final themeStateProvider =
    StateNotifierProvider<ThemeStateNotifier, ThemeState>(
        (_) => ThemeStateNotifier());
