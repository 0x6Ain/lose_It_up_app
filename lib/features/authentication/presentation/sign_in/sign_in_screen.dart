import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/common/button_layout/base_icon_text_button.dart';
import 'package:lose_it_up_app/common/button_layout/base_text_button.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';
import 'package:lose_it_up_app/features/authentication/presentation/sign_in/sign_in_controller.dart';
import 'package:lose_it_up_app/features/authentication/presentation/sign_in/sign_in_validators.dart';
import 'package:lose_it_up_app/features/authentication/presentation/sign_in/string_validators.dart';
import 'package:lose_it_up_app/routes/app_router.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> with SignInValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  var _isSubmitted = false;

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool get _isEnableLoginButton {
    return email.isNotEmpty && password.isNotEmpty;
  }

  Future<void> _submitWithEmailandPassword() async {
    setState(() {
      _isSubmitted = true;
    });
    if (_formKey.currentState!.validate()) {
      final signInController = ref.read(signInControllerProvider.notifier);
      final result = await signInController.submit(
          email: email, password: password, signInFormType: SignInFormType.email);
      if (result) {
        context.goNamed(AppRoute.home.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('SignInScreen')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            gapH64,
            Card(
              child: FocusScope(
                node: _node,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textCapitalization: TextCapitalization.none,
                        validator: (email) => _isSubmitted ? emailErrorText(email ?? '') : null,
                        inputFormatters: <TextInputFormatter>[
                          ValidatorInputFormatter(editingValidator: EmailEditingRegexValidator()),
                        ],
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        autocorrect: false,
                        obscureText: true,
                        validator: (password) =>
                            _isSubmitted ? passwordErrorText(password ?? '') : null,
                      ),
                      gapH32,
                      //Login button
                      BaseTextButton(
                        text: 'Login',
                        isLoading: state.isLoading,
                        onPressed: !_isEnableLoginButton ? null : _submitWithEmailandPassword,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            gapH32,
            //Social login google button
            BaseIconTextButton(
              icon: "assets/icons/google_logo.png",
              text: 'Sign in with Google',
              onPressed: () {
                //TODO:
                print('Sign in with Google');
              },
            ),
            gapH12,
            //Social login apple button
            BaseIconTextButton(
              icon: "assets/icons/apple_logo.png",
              text: 'Sign in with Apple',
              onPressed: () {
                //TODO:
                print('Sign in with Apple');
              },
            ),
          ]),
        ),
      ),
    );
  }
}
