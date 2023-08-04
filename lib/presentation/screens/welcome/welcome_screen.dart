import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/presentation/screens/welcome/widgets/welcome_title.dart';
import 'package:nekonapp/presentation/widgets/widgets.dart';

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

    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
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
              Text('Already have an account? ' ,
                  style: textTheme.bodyLarge),
              ButtonLink(onPress: (){
                context.go('/signIn');
              }, label: 'Sign In',
                  color: theme.secondaryHeaderColor)
            ],
          )
        ]),
      ),
    );
  }
}

