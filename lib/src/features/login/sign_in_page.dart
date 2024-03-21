import 'package:flutter/material.dart';
import 'package:psychology_test_app/src/core/common/common_text_field.dart';
import 'package:psychology_test_app/src/core/common/common_title.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  String? errorMessage;
  IconData iconPassword = Icons.remove_red_eye_rounded;
  bool obscurePassword = true;
  Color suffixColor = AppColors.dark_grey_color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/sign_in.png',
                    width: 303,
                  ),
                  const CommonTitle(
                    text: 'Войдите с помощью корпоративной электронной почты',
                    size: 19,
                  ),
                  const SizedBox(height: 25),
                  CommonTextField(
                    controller: emailController,
                    hintText: 'Электронная почта',
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    errorMsg: errorMessage,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Пожалуйста заполните это поле';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                          .hasMatch(val)) {
                        return 'Введите действительный адрес';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CommonTextField(
                    controller: passwordController,
                    hintText: 'Пароль',
                    obscureText: obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    errorMsg: errorMessage,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Пожалуйста заполните это поле';
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
                          .hasMatch(val)) {
                        return 'Введите действительный пароль';
                      }
                      return null;
                    },
                    suffixColor: suffixColor,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;

                          if (obscurePassword) {
                            iconPassword = Icons.remove_red_eye_rounded;
                            suffixColor = AppColors.dark_grey_color;
                          } else {
                            iconPassword = Icons.remove_red_eye_rounded;
                            suffixColor = AppColors.primary_color;
                          }
                        });
                      },
                      icon: Icon(iconPassword),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // !signInRequired
                  // ? CommonButton(onTap: () {
                  //   if(_formKey.currentState!.validate()){
                  //     //context.read<SignIn>().add
                  //   }
                  // }, text: 'Войти')
                  //     :
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
