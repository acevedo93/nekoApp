import 'package:flutter/material.dart';
import 'package:nekonapp/presentation/screens/signIn/widgets/signIn_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).secondaryHeaderColor;

    final gradientDecoration = BoxDecoration(
        gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            stops: [0.0, 0.8],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight));

    return Scaffold(
        body: Container(
      child: Stack(children: [
        Column(
          children: [
            Container(
              height: height * 1,
              decoration: gradientDecoration,
            ),
            Expanded(child: Container()),
          ],
        ),
        const SignInForm()
      ]),
    ));
  }
}
