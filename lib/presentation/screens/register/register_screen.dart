import 'package:flutter/material.dart';
import 'package:nekonapp/presentation/screens/register/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final primaryColor = Theme.of(context).primaryColor;

    final gradientDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFA7BFD9), primaryColor ],
        stops: [0.0, 0.3],
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
              Container(height: height * 0.4 , decoration: gradientDecoration,),
              Expanded(child: Container(
              )),  
            ],
          ), 
          RegisterForm()
          ]
        ),
      )

    );
  }
}

