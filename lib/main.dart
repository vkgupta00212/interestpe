import 'package:flutter/material.dart';
import 'package:interestpe/pages/IndividualChat.dart';
import 'package:interestpe/pages/Login/otp.dart';
import 'package:interestpe/pages/MorePages/profile.dart';
import 'package:interestpe/pages/interest_chat/lend_money.dart';
import 'package:provider/provider.dart';
import 'model/ChatModel.dart';
import 'pages/Login/login.dart';
import './bottom_navbar.dart';
import 'pages/Splash.dart';
import 'model/data.dart';
import 'utility/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataModel(), // Provide DataModel to the app
      child: MyApp(),
    ),
  );
}

class MyApp extends  StatelessWidget{



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.navBar: (context) => NavBar(),
        MyRoutes.otp: (context) => Otp(),
        MyRoutes.individualChat:(context) => IndividualChat(),
        MyRoutes.lendMoney:(context) => LendMoney(),
        MyRoutes.profile:(context) => ProfilePage(),
      },
    );
  }
}


