import 'package:flutter/material.dart';
import 'package:news_app_again/view/new_details.dart';
class NewWidget extends StatelessWidget {
  const NewWidget({Key? key,required this.index,
  required this.name ,
    required this.img ,
    required this.publishedAt ,
    required this.title,
    required this.content ,
    required this.url
  }) : super(key: key);
final int index ;
final String img ;
final String title;
final String publishedAt;
final String  name ;
final String content;
final String url ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0,right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: ( )  { 
              Navigator.pushNamed(context,NewDetailsScreen.id,
              arguments: ModelForNewDetails(publishedAt: publishedAt,
                  title: title,
                  name: name,
                  index: index,
                  img: img,
                  url: url,
                  content: content
              )
              );
            },
            child: Container(
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior:Clip.antiAlias
              ,
              child: FadeInImage.assetNetwork(


                fit: BoxFit.cover
                , height: MediaQuery.of(context).size.height*0.3,
                placeholder: 'assets/images/loadingPicture.jpg',
                image: img,
                imageErrorBuilder:  ( c,d,v){
                  return Image.asset('assets/images/loadingPicture.jpg');

                },                      ),
            ),
          ),
          const SizedBox(height: 5,),
          Text (

           name,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15
            ), ) ,
          const SizedBox(height: 5,),
          Text(
          title

            ,
            style:  TextStyle (
                color: Colors.black.withOpacity(0.7),
                fontWeight:FontWeight.bold
            ),
          ) ,
          const SizedBox(height: 5,),
          Text(
          publishedAt  ,
            textAlign: TextAlign.end,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          )
        ],
      ),
    );
  }
}
class ModelForNewDetails   {
  final int index ;
  final String img ;
  final String title;
  final String publishedAt;
  final String  name ;
  final String content;
  final String url ;
  ModelForNewDetails(
  {
    required this.publishedAt,
    required this.title ,
    required this.name ,required this.index ,
    required this.img,
    required this.url ,
    required this.content
}
      ) ;
}
