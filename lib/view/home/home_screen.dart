import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_again/animation/fade_animation.dart';
import 'package:news_app_again/providers/everyrhing_provider.dart';
import 'package:news_app_again/providers/news_cetegory.dart';
import 'package:news_app_again/providers/source_provider.dart';
import 'package:news_app_again/utls/constant.dart';
import 'package:news_app_again/view/category_details/category_details.dart';
import 'package:news_app_again/widgets/category_widget.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  static const String id= 'home';
   const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

flexibleSpace: Container (
  decoration: BoxDecoration(
    color: AppConstant.primaryColor,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
      bottomRight: Radius.circular(60)
      )
  ),
  alignment: Alignment.center,
  child: const Text(
      'News App', style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,

        fontSize: 25
  ),),
),

          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height*0.12,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.005,
              ),
              const FadeAnimation(1.2, child:    Text(
                'Pick Your Category of interest',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xff707070)
                ),
              ),),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),

               Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2 ,
                      mainAxisSpacing: 10 ,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.9
                  ),
                  itemBuilder: (ctx,index){
                    return GestureDetector(
                        onTap:  ( ) {
                          Provider.of<NewsCategory>(context,listen: false).getNewsFromCategory(
                              categoryName: index==0?'sports':index==1?'technology':index==2?
                              'health':index==3?'business':index==4?'science':'general'
                          );
                          Provider.of<SourceProvider>(context,listen: false).getSource(
                              categoryName: index==0?'sports':index==1?'technology':index==2?
                              'health':index==3?'business':index==4?'science':'general'
                          );
                          Provider.of<SourceProvider>(context,listen: false).check =false ;

                          Navigator.pushReplacementNamed(
                              context,
                              CategoryDetails.id,
                              arguments:  Provider.of<NewsCategory>(context,listen: false).textContainers[index]
                          ) ;
                        },
                        child:FadeAnimation(1.3,child:  CategoryWidget(index: index,),)
                    );
                  } ,
                  itemCount: 6,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
