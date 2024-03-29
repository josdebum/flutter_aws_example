import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aws_project/auth_screens/email_confirmation_page.dart';
import 'package:flutter_aws_project/auth_screens/signin_screen.dart';
import 'package:flutter_aws_project/auth_screens/signup_screen.dart';
import 'package:flutter_aws_project/home_screens/home_screen.dart';

class AuthenticationRepo {
  /// Signs a user up with a username, password, and email. The required
  /// attributes may be different depending on your app's configuration.
  Future<void> signUpUser({
    required String username,
    required String password,
    required String email,
    String? phoneNumber,
    BuildContext? context,
  }) async {
    print("signing up");
    try {
      final userAttributes = {
        AuthUserAttributeKey.email: email,
        if (phoneNumber != null) AuthUserAttributeKey.phoneNumber: phoneNumber,
        // additional attributes as needed
      };
      print("hello world");
      final result = await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      print(result);
      print(result.isSignUpComplete);
      Navigator.push(
          context!, MaterialPageRoute(builder: (context) =>
      const SignUpScreen2()));

      await _handleSignUpResult(result);
    } on AuthException catch (e) {
      safePrint('Error signing up user: ${e.message}');
    }
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
        print("user successfully registered");
        break;
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
          'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }


  Future<void> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      // Check if further confirmations are needed or if
      // the sign up is complete.
      print(result);
      await _handleSignUpResult(result);
    } on AuthException catch (e) {
      safePrint('Error confirming user: ${e.message}');
    }
  }

  Future<void> signInUser(String username, String password, BuildContext context) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      print(result);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>
      const HomeScreen()));
      await _handleSignInResult(result);
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }
  Future<void> logOut(BuildContext context) async {
    try {
      final result = await Amplify.Auth.signOut(
      );
      print(result);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>
      const LoginScreen()));
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }
  Future<void> _handleSignInResult(SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.confirmSignInWithSmsMfaCode:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignInStep.confirmSignInWithNewPassword:
        safePrint('Enter a new password to continue signing in');
        break;
      case AuthSignInStep.confirmSignInWithCustomChallenge:
        final parameters = result.nextStep.additionalInfo;
        final prompt = parameters['prompt']!;
        safePrint(prompt);
        break;
      // case AuthSignInStep.resetPassword:
      //   final resetResult = await Amplify.Auth.resetPassword(
      //     username: username,
      //   );
      //   await _handleResetPasswordResult(resetResult);
      //   break;
      // case AuthSignInStep.confirmSignUp:
      // // Resend the sign up code to the registered device.
      //   final resendResult = await Amplify.Auth.resendSignUpCode(
      //     username: username,
      //   );
      //   _handleCodeDelivery(resendResult.codeDeliveryDetails);
      //   break;
      case AuthSignInStep.done:
        safePrint('Sign in is complete');
        break;
    }
  }
}