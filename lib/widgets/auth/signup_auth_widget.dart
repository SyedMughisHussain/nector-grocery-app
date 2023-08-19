import 'package:flutter/material.dart';
import 'package:nector_app/auth/log_in.dart';

import '../../pages/others/home_page.dart';
import '../../services/functions/auth_functions.dart';
import '../../utils/colors.dart';
import '../custom_button_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  var userName = '';
  var email = '';
  var password = '';

  void trySignUp() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      AuthService().signUp(context, email, password, userName);
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
              keyboardType: TextInputType.name,
              onSaved: (newValue) {
                userName = newValue!;
              },
              validator: (value) {
                if (value == null || value.length <= 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enter a valid user name')));
                }
                return null;
              },
              decoration: const InputDecoration(
                  hintText: 'Enter your username',
                  label: Text(
                    'Username',
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
            RichText(
              text: const TextSpan(
                  text: 'By continuing you agree to our ',
                  style: TextStyle(color: AppColors.blackColor),
                  children: [
                    TextSpan(
                        text: 'Terms of service and Privacy Policy',
                        style:
                            TextStyle(color: AppColors.splashBackgroundColor)),
                  ]),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton('Sign Up', trySignUp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LogInScreen()));
                    },
                    child: const Text(
                      'SignUp',
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
