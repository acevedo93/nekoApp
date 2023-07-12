import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/widgets/inputs/custom_input.dart';

import '../../../widgets/buttons/button_link.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const titleStyle = TextStyle(
        fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white);

    return Positioned(
      top: 50,
      bottom: 20,
      left: 10,
      right: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Sign In',
              style: titleStyle,
            ),
          ),

          //FORM
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomInput(
                        hint: "Email",
                        obscureText: false,
                        label: 'Email',
                        onChanged: (value) => null,
                      ),
                     
                      CustomInput(
                        obscureText: true,
                        label: 'Password',
                        onChanged: (value) => null,
                      ),

                      SizedBox(height: 40,),
                      
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            minimumSize: Size(double.infinity, 40)),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have account yet? ",
                  style: TextStyle(color: Colors.black)),
              ButtonLink(
                  onPress: () {
                    context.go('/register');
                  }, label: 'Registration', color: theme.primaryColor)
            ],
          )
        ],
      ),
    );
  }
}
