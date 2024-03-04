import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aws_project/widgets/app_textfield.dart';
import 'package:flutter_aws_project/widgets/color_constants.dart';
import 'package:flutter_aws_project/widgets/custom_app_button.dart';
import 'package:flutter_aws_project/widgets/extensions.dart';
import 'package:flutter_aws_project/widgets/home_aws.dart';
import 'package:flutter_aws_project/widgets/size_config.dart';
import 'package:flutter_aws_project/widgets/widget_extension.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  AddNewScreenState createState() => AddNewScreenState();
}

class AddNewScreenState extends State<AddNewScreen> {
  final fullName = TextEditingController();
  final emailAddress = TextEditingController();
  final phoneNumber = TextEditingController();
  final description = TextEditingController();
  final amount = TextEditingController();
  final dateCollected = TextEditingController();
  final dueDate = TextEditingController();
  final homeRepo = HomeRepo();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(child: Scaffold(
        appBar: AppBar(title: Text("Create New Booking")),
        body: SingleChildScrollView(
        child: SingleChildScrollView(child:Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    child: Column(children: <Widget>[

        DottedBorder(
        color: kRed, //color of dotted/dash line
        strokeWidth: 1, //thickness of dash/dots
        dashPattern: const [8, 6],
        borderType: BorderType.Rect,
        child:   Container(width: double.infinity, height: 200, color: kGrey4)),
          AppTextField(title: "Enter client full name", controller: fullName,).addHeight(20.h),
          AppTextField(title: "Enter email address", controller: emailAddress,).addHeight(20.h),
          AppTextField(title: "Enter phone number", controller: phoneNumber,).addHeight(20.h),
          AppTextField(title: "Enter dress style description", controller: description,).addHeight(20.h),
          AppTextField(title: "Amount", controller: amount,).addHeight(20.h),
      AppTextField(
        title: "Date collected",
        controller: dateCollected,
        hasBorder: true,
        isSearch: false,
        hintText: "DD/MM/YYYY",
        readOnly: true,
        suffixIcon: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                        data: ThemeData.dark().copyWith(
                            colorScheme: const ColorScheme.dark(
                              onPrimary:
                              kWhite, // selected text color
                              onSurface:
                              kPrimary, // default text color
                              primary: kPrimary,
                            ),
                           // dialogBackgroundColor: kDarkBg,
                            textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(

                                    // color of button's letters
                                   // backgroundColor: kDarkBg,
                                    padding: const EdgeInsets
                                        .symmetric(
                                        vertical: 10,
                                        horizontal: 10),
                                    // Background color
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors
                                                .transparent,
                                            width: 1,
                                            style: BorderStyle
                                                .solid),
                                        borderRadius:
                                        BorderRadius.circular(
                                            20))))),
                        child: child!);
                  });

              if (pickedDate != null) {
                String formattedDate =
                DateFormat.yMd().format(pickedDate);
                setState(() {
                  dateCollected.text = formattedDate;
                });
              } else {}
            },
            child: Icon(Icons.calendar_month)),
      ).addHeight(16.h),

      AppTextField(
        title: "Due date",
        controller: dueDate,
        hasBorder: true,
        isSearch: false,
        hintText: "DD/MM/YYYY",
        readOnly: true,
        suffixIcon: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                        data: ThemeData.dark().copyWith(
                            colorScheme: const ColorScheme.dark(
                              onPrimary:
                              kWhite, // selected text color
                              onSurface:
                              kPrimary, // default text color
                              primary: kPrimary,
                            ),
                            // dialogBackgroundColor: kDarkBg,
                            textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(

                                  // color of button's letters
                                  // backgroundColor: kDarkBg,
                                    padding: const EdgeInsets
                                        .symmetric(
                                        vertical: 10,
                                        horizontal: 10),
                                    // Background color
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors
                                                .transparent,
                                            width: 1,
                                            style: BorderStyle
                                                .solid),
                                        borderRadius:
                                        BorderRadius.circular(
                                            20))))),
                        child: child!);
                  });

              if (pickedDate != null) {
                String formattedDate =
                DateFormat.yMd().format(pickedDate);
                setState(() {
                  dueDate.text = formattedDate;
                });
              } else {}
            },
            child: Icon(Icons.calendar_month)),
      ).addHeight(16.h),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Row(children: <Widget>[     Text("Client Measurement"), Icon(Icons.add_box)]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Waist length: "),
                        Text("36cm") ,

                      ]),
                ]).addHeight(20),
      AppButton(text: "Add Booking",
          buttonColor: kPrimary,
          textColor: kWhite,
          height: 50.h,
          onTap: () async{
            await homeRepo.savePost(fullName.text,
                description.text, emailAddress.text, phoneNumber.text, amount.text, dateCollected.text, dueDate.text);

            await homeRepo.queryPosts();
          },
          hasBorder: false).addHeight(40.h),

]))))));}}