import 'package:flutter/material.dart';
import 'package:flutter_aws_project/widgets/app_textfield.dart';
import 'package:flutter_aws_project/widgets/color_constants.dart';
import 'package:flutter_aws_project/widgets/extensions.dart';
import 'package:flutter_aws_project/widgets/size_config.dart';
import 'package:flutter_aws_project/widgets/widget_extension.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  AddNewScreenState createState() => AddNewScreenState();
}

class AddNewScreenState extends State<AddNewScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(child: Scaffold(
        body: SingleChildScrollView(
        child: SingleChildScrollView(child:Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    child: Column(children: <Widget>[

          Container(width: double.infinity, height: 200, color: kFillBlack),
          AppTextField(title: "Enter client full name").addHeight(20.h),
          AppTextField(title: "Enter email address").addHeight(20.h),
          AppTextField(title: "Enter phone number").addHeight(20.h),
          AppTextField(title: "Enter dress style description").addHeight(20.h),
          AppTextField(title: "Amount").addHeight(20.h),




]))))));}}