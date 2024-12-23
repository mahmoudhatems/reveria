import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reveria/core/features/login/widgets/app_logo_and_name.dart';
import 'package:reveria/core/features/login/widgets/social_login.dart';
import 'package:reveria/core/helpers/spacing.dart';
import 'package:reveria/core/service/auth_service.dart';
import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/theming/styles.dart';
import 'package:reveria/core/widgets/app_text_button.dart';
import 'package:reveria/core/widgets/app_text_form_field.dart';
import 'package:reveria/core/widgets/or_horizontal_divider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo and App Name
                const AppLogoAndName(),
                verticalSpace(30),

                // Heading
                Text(
                  'Create Account',
                  style: TextStyles.font20TealSemiBold,
                ),
                Text(
                  'We are here to help you!',
                  style: TextStyles.font14GrayMoreRegular,
                ),
                verticalSpace(30),

                // Form Fields
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        validator: (Value) {
                            if (Value=='') {
                              return 'Please enter Your Name';
                            }
                            return null;
                          },
                        controller: nameController,
                        hintText: "Your Name",
                        prefixIcon: Icon(
                          Icons.person_outline,
                          size: 24.sp,
                          color: ColorsManager.lightTextGray,
                        ),
                      ),
                      verticalSpace(16),
                      AppTextFormField(
                        validator: (Value) {
                            if (Value=='') {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        controller: emailController,
                        hintText: "Your Email",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 24.sp,
                          color: ColorsManager.lightTextGray,
                        ),
                      ),
                      verticalSpace(16),
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
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          size: 24.sp,
                          color: ColorsManager.lightTextGray,
                        ),
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
                          ),
                        ),
                      ),
                      verticalSpace(24),
                      AppTextButton(
                        textStyle: TextStyles.font16WhiteSemiBold,
                        buttonText: "Create Account",
                        onPressed: () async {
                        if (formKey.currentState!.validate()){
                            try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                             Navigator.pushReplacementNamed(context, '/home');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          } 

                        }
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),

                // Divider and Social Login
                const OrHorizontalDivider(),
                verticalSpace(20),
                const SocialLogin(),
                verticalSpace(20),

                // Sign In Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do you have an account? ',
                      style: TextStyles.font14LightGrayRegular,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyles.font16TealSemiBold,
                      ),
                    ),
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
