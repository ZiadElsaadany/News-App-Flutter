import 'package:flutter/material.dart';
import 'package:news_app_again/providers/everyrhing_provider.dart';
import 'package:news_app_again/providers/news_cetegory.dart';
import 'package:news_app_again/providers/source_provider.dart';
import 'package:news_app_again/splash/splash_screen.dart';
import 'package:news_app_again/view/category_details/category_details.dart';
import 'package:news_app_again/view/home/home_screen.dart';
import 'package:news_app_again/view/new_details.dart';
import 'package:news_app_again/view/search/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create:(ctx)=>NewsCategory()
        ) ,
        ChangeNotifierProvider(
            create:(ctx)=>SourceProvider()
        ) ,
        ChangeNotifierProvider(
            create:(ctx)=>EverythingProvider()
        ) ,
      ],
      child: const NewsAPP()));
}
class NewsAPP extends StatelessWidget {
  const NewsAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  initialRoute: SplashScreen.route_name,
      routes: {
    CategoryDetails.id:(ctx)=>CategoryDetails(),
    HomeScreen.id:(ctx)=>const HomeScreen(),
        SearchScreen.id : (ctx) =>SearchScreen() ,
        NewDetailsScreen.id: (ctx)=>const NewDetailsScreen(),
        SplashScreen.route_name:(ctx)=> SplashScreen()
      },
    );
  }
}
