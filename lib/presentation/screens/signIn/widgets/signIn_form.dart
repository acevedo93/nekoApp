import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nekonapp/presentation/state/auth/providers/auth_state_provider.dart';
import 'package:nekonapp/presentation/state/auth/providers/is_error_provider.dart';
import 'package:nekonapp/presentation/state/auth/providers/is_loading_provider.dart';
import 'package:nekonapp/presentation/theme/theme.dart';
import 'package:nekonapp/presentation/widgets/messages/snack_bar.dart';
import 'package:nekonapp/utils/forms_validators.dart';
import 'package:nekonapp/presentation/widgets/inputs/custom_input.dart';
import 'package:nekonapp/presentation/widgets/loader/loader.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import '../../../widgets/buttons/button_link.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends ConsumerState<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme= Theme.of(context).textTheme;
    
    void handleLogin() async {
      final loginWithEmailAndPassword =
          ref.read(authStateProvider.notifier).loginWithEmailAndPassword;
      loginWithEmailAndPassword(emailController.text, passwordController.text);
    }

    ref.listen(isErrorProvider, (previous, next) {
      final String errorMessage = next?.message ?? 'Error';
      AnimatedSnackBar(
        builder: ((context) {
          return SnackBarMessage(
              message: errorMessage, messageType: MessageType.error);
        }),
      ).show(context);
    });

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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Sign In',
              style: textTheme.headlineLarge
            ),
          ),

          //FORM
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                          validator: FormValidators.emailValidation,
                          controller: emailController),
                          const SizedBox(height: 20,),
                      CustomInput(
                        mode: InputModes.password,
                        label: 'Password',
                        hint: 'password',
                        validator: FormValidators.passwordValidation,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: handleLogin,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.secondaryHeaderColor,
                            minimumSize: const Size(double.infinity, 40)),
                        child: ref.watch(isLoadingProvider)
                            ? const Loader(size: 20)
                            : const Text(
                                "Sign In",
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
              Text("Don't have account yet? ",
                  style: textTheme.bodyLarge),
              ButtonLink(
                  onPress: () {
                    context.go('/register');
                  },
                  label: 'Registration',
                  color: theme.secondaryHeaderColor)
            ],
          )
        ],
      ),
    );
  }
}
