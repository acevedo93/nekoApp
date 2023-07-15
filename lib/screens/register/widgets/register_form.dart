import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/widgets/inputs/custom_input.dart';

import '../../../widgets/buttons/button_link.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

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
                  'Registration',
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
                            controller: nameController,
                            hint: "Nombre",
                            obscureText: false,
                            label: 'Nombre de usuario',
                            onChanged: (value) => null, 
                          ),
                          CustomInput(
                            controller: emailController,
                            obscureText: false,
                            label: 'Email',
                            onChanged: (value) => null,
                          ),
                          CustomInput(
                            controller: passwordController,
                            mode: InputModes.password,
                            label: 'Password',
                            onChanged: (value) => null,
                          ),
                          
                          CheckboxListTile(
                            value: true,
                            onChanged: (value) {},
                            title: Text("I agree with the rules"),
                            controlAffinity: ListTileControlAffinity.leading, 
                          ),
                           CheckboxListTile(
                            value: true,
                            onChanged: (value) {},
                            title: Text("I agree with the rules"),
                            controlAffinity: ListTileControlAffinity.leading, 
                          ),
                          ElevatedButton(
                            onPressed: (){},
                            child: Text("Sign up", style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              minimumSize: Size(double.infinity, 40)
                            ),
                          ),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  ),
                ),
                
              ),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account? ',
                  style: TextStyle(color: Colors.black)),
              ButtonLink(onPress: () {
                context.go('/signIn');
              }, label: 'Sign In', color: theme.primaryColor)
            ],
          )
            ],
          ),
    );
  }
}
