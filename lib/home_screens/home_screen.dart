import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aws_project/home_screens/add_booking.dart';
import 'package:flutter_aws_project/home_screens/cloth_description_page.dart';
import 'package:flutter_aws_project/models/ModelProvider.dart';
import 'package:flutter_aws_project/widgets/app_style.dart';
import 'package:flutter_aws_project/widgets/color_constants.dart';
import 'package:flutter_aws_project/widgets/custom_app_button.dart';
import 'package:flutter_aws_project/widgets/extensions.dart';
import 'package:flutter_aws_project/widgets/home_aws.dart';
import 'package:flutter_aws_project/widgets/size_config.dart';
import 'package:flutter_aws_project/widgets/widget_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late StreamSubscription _subscription;
  final homeRepo = HomeRepo();
  bool _isLoading = true;
  List<Post> _todos = [];


  @override
  void initState() {
    print("In initState");
    super.initState();
    _initializeApp();

  }

  Future<void> fetchBooking() async {
    List<Post> fetchedData = await homeRepo.queryPosts();
    print("fetched data is ${fetchedData}");
    setState(() {
      if(fetchedData.isNotEmpty ){
        _isLoading = false;
      }
      print("I am God's own");
      _todos = fetchedData;

    });
  }


  Future<void> _initializeApp() async {
    print("jsns");
    //
    // _subscription = Amplify.DataStore.observe(Post.classType).listen((event) {
    //  fetchBooking();
    // });
    await fetchBooking();
    print("I have jpy");
    print("In done");

  }


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
        appBar: AppBar(title: Text("Home screen"), actions: [IconButton(icon:Icon(Icons.refresh), onPressed: () async {
          await homeRepo.fetchedPost; },), ],),
    body:  _isLoading == true
        ? Center(child: CircularProgressIndicator())
        : _todos.isEmpty ? Center(child: Text("No record found")):

    SingleChildScrollView(child:Padding(
    padding:   EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
    child:
      ListView.separated(
        separatorBuilder: (context, int){return SizedBox(height: 20);},
        itemCount: _todos.length,
          shrinkWrap: true,

          itemBuilder: (context, index){
        return
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
                      children: <Widget>[Text(_todos[index].fullName!
                          //_todos[index].fullName!
                          ,
                          style: AppStyle.preTitle),
                        SizedBox(
                            width: 160.w,
                            child:   Text(_todos[index].description!,
                                maxLines: 10, style:
                            TextStyle(overflow: TextOverflow.ellipsis))),
                        Text( _todos[index].dateDue!

                        ),
                        Text(  _todos[index].amount!
                        )
                      ])
                ]) ),);
      }
      ),
    )),

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