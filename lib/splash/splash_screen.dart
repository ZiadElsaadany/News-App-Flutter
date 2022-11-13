import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_again/utls/constant.dart';
import 'package:news_app_again/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route_name=  'Splash' ;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer ;

  goNext( )=> Navigator.pushReplacementNamed(context,HomeScreen.id);

  startDelay(){
    timer=Timer(const Duration(
        milliseconds: 3000
    ), ()=> goNext()
    );
  }
  @override
  void initState() {
    super.initState();
    startDelay()  ;
  }
  @override
  void dispose() {
    timer.cancel() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3,),
          Center(child: Image.asset('assets/images/logo.png',width: 180,height: 180,)),
          const SizedBox(height: 50,),
           CircularProgressIndicator(color: AppConstant.primaryColor),
          const Spacer(flex: 2,),
           Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Text('Ziad Elsaadany',style:TextStyle(
                color:  AppConstant.primaryColor ,
            fontSize: 14,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
    );
  }
}
