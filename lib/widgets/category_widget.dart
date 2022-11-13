import 'package:flutter/material.dart';
import 'package:news_app_again/providers/news_cetegory.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({Key? key,  required this.index}) : super(key: key);
  final int index;


  List<String> images = [
    'assets/images/ball.png',
    'assets/images/Politics.png',
    'assets/images/health.png',
    'assets/images/bussines.png',
    'assets/images/science.png',
    'assets/images/environment.png'
  ] ;
  List<int> colors  =[
    0xffC91C22,0xff003E90,0xffED1E79,0xffCF7E48,
    0xff4882CF,
    0xffF2D352
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(colors[index]),
          border: Border.all(color:Colors.grey , width: 2),
          borderRadius:  BorderRadius.only(
              topLeft: const Radius.circular(40),
              topRight: const Radius.circular(40) ,
              bottomRight: index%2!=0?const Radius.circular(40):const Radius.circular(0),
              bottomLeft:index%2==0?const Radius.circular(40):const Radius.circular(0)
          )
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Image.asset(images[index],width: MediaQuery.of(context).size.width*0.25),
            Text( Provider.of<NewsCategory>(context).textContainers[index],style: const TextStyle(
                fontSize: 22,
                color: Colors.white
            ),) ,
          ]

      ),
    );
  }
}
