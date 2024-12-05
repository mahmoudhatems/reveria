import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:reveria/core/features/login/widgets/app_logo_and_name.dart';
import 'package:reveria/core/features/login/widgets/social_login.dart';
import 'package:reveria/core/helpers/spacing.dart';

import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/theming/styles.dart';
import 'package:reveria/core/widgets/app_text_button.dart';
import 'package:reveria/core/widgets/app_text_form_field.dart';
import 'package:reveria/core/widgets/or_horizontal_divider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();






  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppLogoAndName(),
                verticalSpace(30),
                Text('Hi, Welcome Back!', style: TextStyles.font20TealSemiBold),
                Text('Hope you\'re doing fine.',
                    style: TextStyles.font14GrayMoreRegular),
                verticalSpace(40),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextFormField(
                          validator: (Value) {
                            if (Value=='') {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          controller: emailController,
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 24.sp,
                            color: ColorsManager.lightTextGray,
                            applyTextScaling: true,
                          ),
                        ),
                        verticalSpace(20),
                        AppTextFormField(
                          validator: (Value) {
                            if (Value=='') {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          hintText: "Password",
                          obscureText: isObscure,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: Icon(
                                isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 24.sp,
                                color: ColorsManager.lightTextGray,
                                applyTextScaling: true,
                              )),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 24.sp,
                            color: ColorsManager.lightTextGray,
                            applyTextScaling: true,
                          ),
                        ),
                        verticalSpace(18),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password? ',
                            style: TextStyles.font13TealSemiBold,
                          ),
                        ),
                        verticalSpace(20),
                        AppTextButton(
                            textStyle: TextStyles.font16WhiteSemiBold,
                            buttonText: "Login",
                            onPressed: () async {
                             if (formKey.currentState!.validate()) {
                               try {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                   
                                );Navigator.pushReplacementNamed(context, '/home');
                              } 
                              on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                  Fluttertoast.showToast(
                                      msg: 'No user found for that email.',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.SNACKBAR,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 14.0);
                                } else if (e.code == 'wrong-password') {
                                  print(
                                      'Wrong password provided for that user.');
                                        Fluttertoast.showToast(
                                      msg: 'Wrong password provided for that user.',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.SNACKBAR,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 14.0);
                                      
                                }
                                else {
                                  print('An error occurred');
                                  Fluttertoast.showToast(
                                      msg: 'An error occurred',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.SNACKBAR,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 14.0);
                                }
                              }
                              }
                            }),
                        verticalSpace(25),
                        const OrHorizontalDivider(),
                        verticalSpace(25),
                        const SocialLogin(),////////////////////////////////////// google sign in 
                        verticalSpace(25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account? ',
                              style: TextStyles.font14LightGrayRegular,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/register');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyles.font16TealSemiBold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
