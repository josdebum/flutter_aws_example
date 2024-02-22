import 'package:flutter/material.dart';
import 'package:flutter_aws_project/auth_aws.dart';
import 'package:flutter_aws_project/auth_screens/email_confirmation_page.dart';
import 'package:flutter_aws_project/auth_screens/signin_screen.dart';
import 'package:flutter_aws_project/widgets/app_textfield.dart';
import 'package:flutter_aws_project/widgets/color_constants.dart';
import 'package:flutter_aws_project/widgets/custom_app_button.dart';
import 'package:flutter_aws_project/widgets/extensions.dart';
import 'package:flutter_aws_project/widgets/size_config.dart';
import 'package:flutter_aws_project/widgets/widget_extension.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
  final authRepo = AuthenticationRepo();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(title: Text('Sign Up',),),
        body: SingleChildScrollView(child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(children: <Widget>[
              SizedBox(height: 20.h),
              AppTextField(title: "Enter your Email", controller: emailController,).addHeight(20.h),
               AppTextField(title: "Enter your Username", controller: usernameController,).addHeight(20.h),
               AppTextField(title: "Phone number", controller: phoneController,).addHeight(20.h),
              AppTextField(title: "Password", controller: passwordController,).addHeight(20.h),
               AppTextField(title: "Confirm Password", controller: confirmPassword,).addHeight(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:4),
                child:RichText(
                  text: const  TextSpan(
                    style: TextStyle( fontSize: 12, fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(text: "By continuing, you agree to our ",
                      ),
                      TextSpan(text: 'terms of condition ', style: TextStyle(
                          decoration: TextDecoration.underline, color: kPrimary)),
                      TextSpan(text: 'and '),
                      TextSpan(text: "privacy policy.", style: TextStyle(
                          decoration: TextDecoration.underline, color: kPrimary))
                    ],
                  ),),
              ).addHeight(30.h),

              AppButton(text: "Sign Up",
                  buttonColor: kPrimary,
                  textColor: kWhite,
                  height: 50.h,
                  onTap: (){
                // authRepo.signUpUser(
                //     username: usernameController.text,
                //     context: context,
                //     password: passwordController.text,
                //     email: emailController.text,
                // phoneNumber:phoneController.text );
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                    const SignUpScreen2()));
                // Navigator.push(
                //       context, MaterialPageRoute(builder: (context) =>
                //   const SignUp2Screen()));
                },
                  hasBorder: false).addHeight(20.h),
              Padding(padding:
              const EdgeInsets.symmetric(horizontal: 4), child:
              Row(children: <Widget>[
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(color: kBlack, height: 1)),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10), child:
                Text("or sign in with")),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(color: kBlack, height: 1)),
              ])).addHeight(40.h),


              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[Text("Already have an account? "),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>
                          const LoginScreen()));
                        },
                        child:
                        Text("SIGN IN", style: TextStyle(color: kPrimary),))

                  ])
            ])
        )));
  }
}
