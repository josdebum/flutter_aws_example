import 'package:flutter/material.dart';
import 'package:flutter_aws_project/widgets/color_constants.dart';
import 'package:flutter_aws_project/widgets/extensions.dart';
import 'package:flutter_aws_project/widgets/size_config.dart';

class ClothDescriptionScreen extends StatefulWidget {
  const ClothDescriptionScreen({super.key});

  @override
  ClothDescriptionScreenState createState() => ClothDescriptionScreenState();
}

class ClothDescriptionScreenState extends State<ClothDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        body: SingleChildScrollView(
            child:
      Stack(children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: kRed),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 500,
                width: double.infinity,
                color: kGrey3,
                child: Image.asset(
                  "assets/pngs/style_1.jpeg",
                  fit: BoxFit.cover,
                ))),

        Positioned(
            top: 40, right: 20, child: GestureDetector(
          onTap: (){
              Navigator.pop(context);
          },
            child:
        Icon(Icons.cancel_outlined, size: 30))),
        Positioned(
           top: 450,
            right: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: kWhite),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Deborah Joseph"),
                      Text("joseph@gmail.com"),
                      Text("+2348135579454"),
                      Text("Dress description"),
                      Text("Due date: "),
                      Text("Date collected: "),
                      Text("Amount Paid"),
                      Checkbox(value: false, onChanged: (value) {})
                    ]))),

        Positioned(
            bottom: 90,
           left: 0,
            right: 0,

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

         Row(children: <Widget>[     Text("Client Measurement"), Icon(Icons.add_box)]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  Text("Waist length: "),
                Text("36cm") ,
                  Icon(Icons.delete),
                ]),




            ]))

    ])));
  }
}
