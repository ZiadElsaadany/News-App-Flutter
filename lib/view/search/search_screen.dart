import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_again/providers/everyrhing_provider.dart';
import 'package:news_app_again/widgets/new_widget.dart';
import 'package:provider/provider.dart';

import '../../utls/constant.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
static const String id = 'search';
  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }
  String word= '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<EverythingProvider>(
        builder: (context,provider,_) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton (
                onPressed: ( )  {
                  Navigator.pop(context);
                } ,
                icon: const Icon(Icons.arrow_back_ios,size: 25),
              ),
              toolbarHeight:MediaQuery.of(context).size.height*0.17,
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
                child:  TextFormField(
                  controller: fieldText,
                  onChanged: ( value)  {
                    word =value;
                    provider.search(word: value);
                  },
                  decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder (
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppConstant.primaryColor
                      )
                    ),
                   focusedBorder: OutlineInputBorder (
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: AppConstant.primaryColor
                      )
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search Article',
                    suffixIcon: IconButton(
                      icon : Icon ( Icons.search,size: 30,color: AppConstant.primaryColor,)   ,
                    onPressed: ( ) {
                      provider.search(word: word);
                    },
                    ) ,
                    prefixIcon: IconButton (
                      onPressed: ( ) {
                        clearText();
                        provider.dataSearch=  [] ;
                      } ,
                      icon: Icon(Icons.clear,size: 30,color: AppConstant.primaryColor),
                    )
                  ),
                )
              ),
            ),
            body:provider.dataSearch==[] || provider.dataSearch.isEmpty ?

Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Center(child: Image.asset('assets/images/noFavpng.png')),
  ],
)

            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(itemBuilder: (ctx,index )  {
                return   NewWidget(index: index ,
                publishedAt:  provider.dataSearch[index]['publishedAt']??'' ,
                  title:provider.dataSearch[index]['title']??'' ,
                  name: provider.dataSearch[index]['name']??'',
img: provider.dataSearch[index]['urlToImage' ]?? '',
                  url: provider.dataSearch[index]['url']??''
                  , content:provider.dataSearch[index]['content']??'',
                )  ;
              } ,
              itemCount:provider.dataSearch.length ,
              ),
            ),
          );
        }
      ),
    );
  }
}
