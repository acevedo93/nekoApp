import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/screens/welcome/widgets/welcome_title.dart';
import 'package:nekonapp/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.primaryColor, body: const _WelcomeView());
  }
}

class _WelcomeView extends StatelessWidget {
  const _WelcomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(children: [
          const SizedBox(height: 100),
          const WelcomeTitle(),
          const SizedBox(height: 50),
          const GoogleButtonSignIn(),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton(
              onPressed: () {
                context.go('/register');
              }, child: const Text("Register with Email")),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account? ' ,style: TextStyle(color: Colors.white)),
              ButtonLink(onPress: (){}, label: 'Sign In')
            ],
          )
        ]),
      ),
    );
  }
}

