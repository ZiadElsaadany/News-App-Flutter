import 'package:flutter/material.dart';
import 'package:news_app_again/animation/fade_animation.dart';
import 'package:news_app_again/widgets/new_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utls/constant.dart';

class NewDetailsScreen extends StatelessWidget {
  const NewDetailsScreen({Key? key}) : super(key: key);
static const String id= 'newDet';
  @override
  Widget build(BuildContext context) {
    var args  = ModalRoute.of(context)?.settings.arguments as ModelForNewDetails ;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton (
            onPressed: ( )  {
              Navigator.pop(context);
            } ,
            icon: const Icon(Icons.arrow_back_ios,size: 20,),
          ),
          toolbarHeight:MediaQuery.of(context).size.height*0.12,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container (
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  color: AppConstant.primaryColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  )
              ),
              alignment: Alignment.center,
              child:  Text(args.title,
              maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ) ,


          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             FadeAnimation(1.1, child: FadeInImage.assetNetwork(
               placeholder: 'assets/images/loadingPicture.jpg',
               image:args.img ,
               imageErrorBuilder: ( c,v,b)  {
                 return Image.asset('assets/images/loadingPicture.jpg');
               },
             ) ,),
                const SizedBox(height: 10,),
                FadeAnimation(1.2, child:  Text(args.name,style: const TextStyle(
                    color: Colors.grey ,
                    fontWeight: FontWeight.bold
                ),),),

                const SizedBox(height: 10,),
                FadeAnimation(1.3, child:  Text(args.title,style:  TextStyle(
                    color: Colors.black.withOpacity(0.7) ,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),),


                const SizedBox(height: 10,),
                FadeAnimation(1.4, child:                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(args.publishedAt
                      ,style: const TextStyle(
                          color: Colors.grey ,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                  ],
                ),),
                const SizedBox(height: 20,),
                FadeAnimation(1.5, child:                  Text(args.content ,style:  TextStyle(
                    color: Colors.black.withOpacity(0.6) ,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),),
                 SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                FadeAnimation(1.6, child:                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [

                      GestureDetector(
                          onTap:  ( )  async{
                            if(await canLaunchUrl(Uri.parse(args.url ) )) {
                              launchUrl(Uri.parse(args.url));
                            }
                          },
                          child: const Text('View Full Article' ,style:  TextStyle(
                              color: Colors.black ,
                              fontWeight: FontWeight.bold
                          ),)),
                      const Icon(Icons.arrow_right,size: 40,)
                    ],
                  ),
                )),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
