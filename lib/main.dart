import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aws_project/auth_screens/signin_screen.dart';
import 'package:flutter_aws_project/home_screens/home_screen.dart';
import 'package:flutter_aws_project/models/ModelProvider.dart';
import 'package:flutter_aws_project/widgets/size_config.dart';

import 'amplifyconfiguration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _configureAmplify();
    setState(() {
      _isLoading = true; // important to set the state!
    });
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      final storage = AmplifyStorageS3();
      final datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
      await Amplify.addPlugins([auth, storage, datastorePlugin]).then((_) {
        return Amplify.configure(amplifyconfig);
      }).whenComplete(() =>
          setState(() {
            _isLoading = false; // important to set the state!
          })
      );
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }


  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _isLoading == true
          ? Center(child: CircularProgressIndicator())
          :  HomeScreen()
    );
  }
}