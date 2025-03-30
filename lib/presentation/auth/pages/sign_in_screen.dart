import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locket_clone/common/widgets/transition_wrapper/transition_wrapper.dart';
import 'package:locket_clone/data/model/sign_in_req/sign_in_req.dart';
import 'package:locket_clone/domain/usecases/sign_in_use_case.dart';
import 'package:locket_clone/presentation/auth/pages/sign_up_screen.dart';
import 'package:locket_clone/presentation/home/camera_screen/camera_screen.dart';

import '../../../common/bloc/button/button_cubit.dart';
import '../../../common/utils/custom_navigate.dart';
import '../../../core/configs/theme/app_theme.dart';

final textColor = Color(0xff626262);

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _textStyle = TextStyle(letterSpacing: 1.3, color: textColor, fontSize: 12,);
  final _formKey = GlobalKey<FormState>(); // Quản lý form
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
    hintStyle: TextStyle(
      letterSpacing: 1.3,
      color: Color(0xff626262),
      fontSize: 12,
    ),
  );

  bool _showPass = false;

  final _loginCon = TextEditingController();
  final _passwordCon = TextEditingController();

  Widget _loginField() {
    return TextFormField(
      controller: _loginCon,
      cursorColor: Color(0xff828282),
      style: _textStyle,
      decoration: _textFieldDecoration.copyWith(hintText: 'Number Phone/Email Address'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email or phone number';
        }
        return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
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

  Widget _rememberMeCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          activeColor: Color(0xff738F81),
        ),
        Text(
          'Remember me',
          style: TextStyle(color: Color(0xff738F81)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ButtonCubit>(
      create: (context) => ButtonCubit(),
      child: Scaffold(
        body: BlocListener<ButtonCubit, ButtonState>(
          listener: (blocContext, state) {
            if (state is ButtonSuccessState) {
              Navigator.push(
                blocContext,
                MaterialPageRoute(
                  builder: (blocContext) => TransitionWrapper(),
                ),
              );
            }
            if (state is ButtonFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 31),
            decoration: BoxDecoration(
              color: Color(0xffD0E2DE),
            ),
            child: Column(
              children: [
                Spacer(),
                Text(
                  'Welcome back!',
                  style: AppTheme.bigText.copyWith(
                    color: Color(0xffFFFFFF),
                    fontSize: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _loginField(),
                          SizedBox(
                            height: 23,
                          ),
                          _passwordField(),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _rememberMeCheckbox(),
                              TextButton(
                                onPressed: () {},
                                child: Text('Forgot Password?'),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Cancel'),
                      ),
                      BlocBuilder<ButtonCubit, ButtonState>(
                        builder: (context, state) {
                          if (state is ButtonLoadingState) {
                            return ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: const Color(0xff738F81),
                                ),
                              ),
                            );
                          }
                          return ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()) {
                                context.read<ButtonCubit>().execute(
                                  usecase: SignInUseCase(),
                                  params: SignInReq(
                                    loginInfo: _loginCon.text,
                                    password: _passwordCon.text,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xff738F81),
                              backgroundColor: Colors.white,
                            ),
                            child: Text('Sign In'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account? '),
                    GestureDetector(
                      onTap: () => customNavigate(context, SignUpScreen()),
                      child: Text(
                        'Sign up',
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
        ),
      ),
    );
  }



}
