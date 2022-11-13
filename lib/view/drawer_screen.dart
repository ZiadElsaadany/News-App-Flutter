import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_again/utls/constant.dart';
import 'package:news_app_again/view/home/home_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height*0.2 ,
          color: AppConstant.primaryColor,
          child:  const Text('News App!',
          style: TextStyle(
            color: Colors.white ,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),)
        ) ,

        Padding(
          padding:  const EdgeInsets.all(15.0),
          child: Row(
            children:  [
              const Icon(Icons.category_outlined,size: 30) ,
              const SizedBox(
                width:15,
              ),
              GestureDetector(
                onTap: ( )  {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
                child: const Text('Categories',
                style: TextStyle (
                  color: Colors.black,
                  fontWeight: FontWeight.bold ,
                  fontSize: 22
                ),),
              )
            ],
          ),
        )
      ],
    );
  }
}
