
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reveria/core/helpers/strings.dart';
import 'package:reveria/core/routing/routes.dart';
import 'package:reveria/core/theming/colors.dart';
import 'package:reveria/core/theming/styles.dart';

class SocialLoginButton extends StatefulWidget {
  final String iconPath;
  final String text;
  final VoidCallback? onTap;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.text,
    this.onTap,
  });

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: widget.onTap,
      child: Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: ColorsManager.textFormFieldBackground,
          border: Border.all(color: ColorsManager.lightGray, width: 1.3.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.iconPath,
                height: 30.h,
              ),
              SizedBox(width: 20.w),
              Text(
                widget.text,
                style:  TextStyles.font14LightGrayRegular.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    
Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if (googleUser == null) {
    return;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
   await FirebaseAuth.instance.signInWithCredential(credential);
  Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
}
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          iconPath: Strings.googleIcon, // Replace with your Google icon path
          text: 'Sign In with Google',
          onTap: () {
           signInWithGoogle();
          },
        ),
        SocialLoginButton(
          iconPath: Strings.facebookIcon, // Replace with your Facebook icon path
          text: 'Sign In with Facebook',
          onTap: () {
            // Handle Facebook sign-in logic here
          },
        ),
      ],
    );
  }
}
