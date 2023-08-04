import 'package:flutter/material.dart';
import 'package:nekonapp/presentation/screens/register/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).secondaryHeaderColor;

 final gradientDecoration = BoxDecoration(
        gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            stops: const [0.5, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
        )

    );

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
            children: [
              Container(height: height, decoration: gradientDecoration,),
              Expanded(child: Container(
              )),  
            ],
          ), 
          const RegisterForm()
          ]
        ),
      )
    );
  }
}

