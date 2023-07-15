import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/utils/forms_validators.dart';
import 'package:nekonapp/widgets/inputs/custom_input.dart';
import '../../../services/firebase/auth.dart';
import '../../../widgets/buttons/button_link.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = Auth();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const titleStyle = TextStyle(
        fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white);

    void handleLogin() {
      if (_formKey.currentState!.validate()) {
        authService.loginWithEmailAndPassword(
            emailController.text, passwordController.text);
      }
    }

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
            icon: const Icon(Icons.arrow_back),
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
                          mode: InputModes.email,
                          hint: "Email",
                          label: 'Email',
                          onChanged: (value) => null,
                          validator: FormValidators.emailValidation,
                          controller: emailController
                          ),
                      CustomInput(
                        mode: InputModes.password,
                        label: 'Password',
                        hint: 'password',
                        onChanged: (value) => null,
                        validator: FormValidators.passwordValidation,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: handleLogin,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            minimumSize: const Size(double.infinity, 40)),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
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
                  },
                  label: 'Registration',
                  color: theme.primaryColor)
            ],
          )
        ],
      ),
    );
  }
}
