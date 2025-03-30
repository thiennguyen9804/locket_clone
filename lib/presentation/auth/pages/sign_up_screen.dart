import 'package:flutter/material.dart';
import 'package:locket_clone/common/utils/custom_navigate.dart';
import 'package:locket_clone/presentation/auth/pages/sign_in_screen.dart';
import '../../../core/configs/theme/app_theme.dart';

final textColor = Color(0xff626262);

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _textStyle = TextStyle(letterSpacing: 1.3, color: textColor);
  final _textFieldDecoration = InputDecoration(
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff828282),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: textColor,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    contentPadding: EdgeInsets.only(left: 28),
    hintText: 'Email',
    hintStyle: TextStyle(letterSpacing: 1.3, color: Color(0xff626262), fontSize: 12),
  );

  bool _showPass = true;
  bool _showConfirmPass = true;

  final _fullNameCon = TextEditingController();
  final _phoneNumberCon = TextEditingController();
  final _emailAddressCon = TextEditingController();
  final _passwordCon = TextEditingController();
  final _confirmPasswordCon = TextEditingController();

  Widget _fullNameField() {
    return TextField(
      controller: _fullNameCon,
      cursorColor: Color(0xff828282),
      style: _textStyle,
      decoration: _textFieldDecoration.copyWith(hintText: 'Full Name'),
    );
  }

  Widget _phoneNumberField() {
    return TextField(
      controller: _phoneNumberCon,
      cursorColor: Color(0xff828282),
      style: _textStyle,
      decoration: _textFieldDecoration.copyWith(hintText: 'Phone Number'),
    );
  }

  Widget _emailAddressField() {
    return TextField(
      controller: _emailAddressCon,
      cursorColor: Color(0xff828282),
      style: _textStyle,
      decoration: _textFieldDecoration.copyWith(hintText: 'Email Address'),
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: !_showPass,
      controller: _passwordCon,
      cursorColor: Color(0xff828282),
      style: _textStyle,
      decoration: _textFieldDecoration.copyWith(
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _showPass ? Icons.visibility : Icons.visibility_off,
            color: textColor,
          ),
          onPressed: () {
            setState(() {
              _showPass = !_showPass;
            });
          },
        ),
      ),
    );
  }

  Widget _confirmPasswordField() {
    return TextField(
      obscureText: !_showConfirmPass,
      controller: _confirmPasswordCon,
      cursorColor: Color(0xff828282),
      style: _textStyle,
      decoration: _textFieldDecoration.copyWith(
        hintText: 'Confirm Password',
        suffixIcon: IconButton(
          icon: Icon(
            _showConfirmPass ? Icons.visibility : Icons.visibility_off,
            color: textColor,
          ),
          onPressed: () {
            setState(() {
              _showConfirmPass = !_showConfirmPass;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 31),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Sign up',
              style: AppTheme.bigText,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Color(0xffD0E2DE),
                ),
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 28),
                child: Column(
                  children: [
                    _fullNameField(),
                    SizedBox(
                      height: 23,
                    ),
                    _phoneNumberField(),
                    SizedBox(
                      height: 23,
                    ),
                    _emailAddressField(),
                    SizedBox(
                      height: 23,
                    ),
                    _passwordField(),
                    SizedBox(
                      height: 23,
                    ),
                    _confirmPasswordField(),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 14,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? '),
                GestureDetector(
                  onTap: () => customNavigate(context, SignInScreen()),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xff738F81),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
