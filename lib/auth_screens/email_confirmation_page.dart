import 'package:flutter/material.dart';
import 'package:flutter_aws_project/auth_aws.dart';
import 'package:flutter_aws_project/auth_screens/signup_screen.dart';
import 'package:flutter_aws_project/widgets/app_textfield.dart';
import 'package:flutter_aws_project/widgets/color_constants.dart';
import 'package:flutter_aws_project/widgets/custom_app_button.dart';
import 'package:flutter_aws_project/widgets/extensions.dart';
import 'package:flutter_aws_project/widgets/size_config.dart';
import 'package:flutter_aws_project/widgets/widget_extension.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});
  @override
  SignUpScreen2State createState() => SignUpScreen2State();
}

class SignUpScreen2State extends State<SignUpScreen2> {
  final codeController = TextEditingController();
  final userNameController = TextEditingController();
  final authRepo = AuthenticationRepo();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(title: Text("Sign In")),
        body: SingleChildScrollView(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(children: <Widget>[
              SizedBox(height: 70.h),
               AppTextField(title: "Enter your confirmation code", controller: codeController,).addHeight(20.h),
              AppTextField(title: "Enter your username", controller: userNameController,).addHeight(80.h),
              AppButton(text: "Confirm Code",
                  buttonColor: kPrimary,
                  textColor: kWhite,
                  height: 50.h,
                  onTap: () async{
                await authRepo.confirmUser(username: userNameController.text,
                    confirmationCode: codeController.text);


                  },
                  hasBorder: false).addHeight(40.h),
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
              ])).addHeight(60.h),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("Don’t have an account? "),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>
                          const SignUpScreen()));
                        },
                        child:
                        Text("SIGN UP", style: TextStyle(color: kPrimary),)
                    )

                  ])
            ])
        )));
  }


}