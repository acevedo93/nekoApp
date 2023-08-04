import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/presentation/state/auth/providers/auth_state_provider.dart';
import 'package:nekonapp/presentation/theme/theme.dart';
import 'package:nekonapp/utils/forms_validators.dart';
import 'package:nekonapp/presentation/widgets/inputs/custom_input.dart';
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
    final textTheme= Theme.of(context).textTheme;

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
            color: secondary,
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Registration',
              style: textTheme.headlineLarge,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
              Form(
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
                    const SizedBox(
                      height: 20,
                    ),
                      CustomInput(
                        controller: emailController,
                        obscureText: false,
                        label: 'Email',
                        onChanged: (value) => null,
                        validator: FormValidators.emailValidation,
                      ),
                        const SizedBox(
                      height: 20,
                    ),
                      CustomInput(
                        controller: passwordController,
                        mode: InputModes.password,
                        label: 'Password',
                        onChanged: (value) => null,
                        validator: FormValidators.passwordValidation,
                      ), 
                        const SizedBox(
                      height: 20,
                    ),
                      ElevatedButton(
                        onPressed: 
                          handleRegister,
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40)),
                       child: ref.watch(isLoadingProvider)
                            ? const Loader(size: 20)
                            : const Text(
                                "Sign up",
                                style: TextStyle(color: primary),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account? ',
                  style: textTheme.bodyLarge),
              ButtonLink(
                  onPress: () {
                    context.go('/signIn');
                  },
                  label: 'Sign In',
                  color: secondary)
            ],
          )
        ],
      ),
    );
  }
}
