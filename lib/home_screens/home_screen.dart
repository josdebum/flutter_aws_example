import 'package:flutter/material.dart';
import 'package:flutter_aws_project/home_screens/add_booking.dart';
import 'package:flutter_aws_project/home_screens/cloth_description_page.dart';
import 'package:flutter_aws_project/widgets/app_style.dart';
import 'package:flutter_aws_project/widgets/color_constants.dart';
import 'package:flutter_aws_project/widgets/extensions.dart';
import 'package:flutter_aws_project/widgets/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
        appBar: AppBar(title: Text("Home screen")),
    body: SingleChildScrollView(child:Padding(
    padding:   EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    child: Column(children:  <Widget>[
    GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>
        const ClothDescriptionScreen()));
      },
      child:
    Container(height: 200, width: MediaQuery.of(context).size.width,
          color: kLightGreen, child: Row(children:<Widget>[
            Container(width: 180, height: 360, color: kWhite,
                child: Image.asset("assets/pngs/style_1.jpeg")),

            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text("Deborah Joseph", style: AppStyle.preTitle),
           SizedBox(
               width: 160.w,
               child:   Text("Life is moving fast and the dollar seems"
                  "Where is the fat account balance, the car, the well furnished apartment"
                  " and that dream job; seems you haven’t figured anything out.", maxLines: 10, style:
           TextStyle(overflow: TextOverflow.ellipsis))),
              Text("Due date: 01/02/2024"),
            ])
          ]) ),)



    ]))),

    floatingActionButton: FloatingActionButton(onPressed: () {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) =>
    const AddNewScreen())); },
    child:
    Container(child: Icon(Icons.add)),

    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

    );

}}