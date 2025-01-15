import 'package:flutter/material.dart';
import 'package:new_project/Model/fetchingdata.dart';
import 'package:new_project/Views/view_screen_1.dart';
import 'package:new_project/Views/view_screen_2.dart';
import 'package:new_project/Views/view_screen_3.dart';
import 'package:provider/provider.dart';

import 'components/Minor_screen.dart/stack_framework.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApiProvider()..fetchData(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cred_Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color.fromARGB(255, 23, 23, 47),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomStackWidget(
          views: [
            View1(),
            View2(creditAmount:"150000"),
            View3(),




          ],


          ctas: const [
            'Proceed to EMI selection',
            'Select your bank account',
            'Tap for 1 click KYC',

          ],
          cycle: false,
        ),
      ),
    );
  }
}
