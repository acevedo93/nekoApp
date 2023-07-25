import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/state/auth/providers/auth_state_provider.dart';
import 'package:nekonapp/utils/forms_validators.dart';
import 'package:nekonapp/widgets/inputs/custom_input.dart';
import '../../../state/auth/providers/is_loading_provider.dart';
import '../../../widgets/buttons/button_link.dart';
import '../../../widgets/loader/loader.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends ConsumerState<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const titleStyle = TextStyle(
        fontSize: 38, fontWeight: FontWeight.bold, color: Colors.white);

    void handleRegister() async {
      final registerWithEmailAndPassword = ref
          .read(authStateProvider.notifier)
          .registerWithEmailAndPassword;

      registerWithEmailAndPassword(emailController.text, passwordController.text, nameController.text);
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
                        validator: FormValidators.emailValidation,
                      ),
                      CustomInput(
                        controller: passwordController,
                        mode: InputModes.password,
                        label: 'Password',
                        onChanged: (value) => null,
                        validator: FormValidators.passwordValidation,
                      ), 
                      ElevatedButton(
                        onPressed: 
                          handleRegister,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            minimumSize: const Size(double.infinity, 40)),
                       child: ref.watch(isLoadingProvider)
                            ? const Loader(size: 20)
                            : const Text(
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
              const Text('Already have an account? ',
                  style: TextStyle(color: Colors.black)),
              ButtonLink(
                  onPress: () {
                    context.go('/signIn');
                  },
                  label: 'Sign In',
                  color: theme.primaryColor)
            ],
          )
        ],
      ),
    );
  }
}
