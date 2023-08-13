import 'package:flutter/material.dart';
import 'package:lose_it_up_app/common/button_layout/base_icon_text_button.dart';
import 'package:lose_it_up_app/common/button_layout/base_text_button.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';
import 'package:lose_it_up_app/features/authentication/presentation/sign_in/sign_in_validators.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SignInValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _emailEditingComplete() {
    if (canSubmit(email)) {
      _node.nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignInScreen')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
            child: FocusScope(
              node: _node,
              child: SingleChildScrollView(
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
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // _enteredEmail = value!;
                        },
                        onEditingComplete: () => _emailEditingComplete(),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        autocorrect: false,
                        validator: (value) {
                          if (value == null || value.trim().length < 8) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // _enteredEmail = value!;
                        },
                      ),
                      gapH32,
                      BaseTextButton(
                        text: 'Login',
                        onPressed: () {
                          //TODO:
                          print('login');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          gapH32,
          BaseIconTextButton(
            icon: "assets/icons/google_logo.png",
            text: 'Sign in with Google',
            onPressed: () {
              //TODO:
              print('Sign in with Google');
            },
          ),
          gapH12,
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
    );
  }
}
