import 'package:flutter/material.dart';
import 'package:nector_app/services/functions/auth_functions.dart';
import 'package:nector_app/utils/colors.dart';

import '../../pages/others/home_page.dart';
import '../custom_button_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  AuthFunction? auth;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  var email = '';
  var password = '';

  void tryLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      auth!.logIn(context, email, password);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              cursorColor: AppColors.blackColor,
              keyboardType: TextInputType.emailAddress,
              // controller: emailController,
              onSaved: (newValue) {
                email = newValue!;
              },
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter a valid Email address.')));
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  label: Text(
                    'Email',
                    style: TextStyle(color: AppColors.blackColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.darkGreyColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              cursorColor: AppColors.blackColor,
              keyboardType: TextInputType.text,
              obscureText: _obscureText,
              // controller: passwordController,
              onSaved: (newValue) {
                password = newValue!;
              },
              validator: (value) {
                if (value == null && value!.length < 5) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Enter valid password to continuw')));
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter your password',
                label: const Text(
                  'Password',
                  style: TextStyle(color: AppColors.blackColor),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.darkGreyColor)),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                suffixIcon: IconButton(
                    onPressed: () => setState(() {
                          _obscureText = !_obscureText;
                        }),
                    icon: Icon(_obscureText
                        ? Icons.visibility
                        : Icons.visibility_off)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topRight,
              child: const Text(
                'Forgot password?',
                textAlign: TextAlign.end,
              ),
            ),
            CustomButton('Log In', tryLogin),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont\'t have an account?'),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: AppColors.splashBackgroundColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
