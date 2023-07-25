import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/state/auth/providers/auth_state_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ref.read(authStateProvider.notifier).logOut,
          icon: Icon(Icons.exit_to_app),

        ) ,
      ),
    );
  }
}
