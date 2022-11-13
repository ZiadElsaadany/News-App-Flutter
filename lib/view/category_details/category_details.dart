import 'package:flutter/material.dart';
import 'package:news_app_again/providers/everyrhing_provider.dart';
import 'package:news_app_again/providers/news_cetegory.dart';
import 'package:news_app_again/providers/source_provider.dart';
import 'package:news_app_again/view/category_details/source_widget.dart';
import 'package:news_app_again/view/drawer_screen.dart';
import 'package:news_app_again/widgets/new_widget.dart';
import 'package:provider/provider.dart';

import '../../utls/constant.dart';
import '../search/search_screen.dart';

class CategoryDetails extends StatelessWidget {
static const String id= 'CategoryName';


bool check = false;

  CategoryDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)?.settings.arguments as String ;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container (
            decoration: BoxDecoration(
                color: AppConstant.primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                )
            ),
            alignment: Alignment.center,
            child:  Text(
              args, style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,

                fontSize: 25
            ),),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconButton(onPressed: (){
                Provider.of<EverythingProvider>(context,listen: false).dataSearch = [] ;
                Navigator.pushNamed(context, SearchScreen.id);
              }, icon:
              const Icon(Icons.search,size: 30,)
              ),
            )
          ],
          toolbarHeight: MediaQuery.of(context).size.height*0.10,
          backgroundColor:  Colors.transparent,
          elevation: 0,
        ),
        drawer: const Drawer(

          child: DrawerScreen(),
        ),
        body: Provider.of<NewsCategory>(context).loading || Provider.of<EverythingProvider>(context).loading?
        Center(child: CircularProgressIndicator(
          color: AppConstant.primaryColor,
        )):
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
              child: ListView.builder(
                physics:const BouncingScrollPhysics(),

scrollDirection: Axis.horizontal,
                  itemCount: Provider.of<SourceProvider>(context).data.length,
                  itemBuilder:  ( context,index) {

                    return GestureDetector(
                        onTap: ( )
                        {
                          Provider.of<EverythingProvider>(context,listen: false).getEverything(
                              sourceId: Provider.of<SourceProvider>(context,listen: false).data[index]['id']) ;
                          Provider.of<SourceProvider>(context,listen: false).changeCheck();
                        } ,
                        child: SourceWidget(index: index,));
                  }),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (ctx,index){
                  return const SizedBox(
                    height: 30,
                  );
                },
                itemBuilder: (ctx,index){
                  return NewWidget(


                    index: index,
                  img:  Provider.of<SourceProvider>(context).check==false?
                  Provider.of<NewsCategory>(context).data[index]['urlToImage']??'' :
                  Provider.of<EverythingProvider>(context).data[index]['urlToImage']??'',


                    name:
    Provider.of<SourceProvider>(context).check==false?
    Provider.of<NewsCategory>(context).data[index]['source']['name']?? '':Provider.of<EverythingProvider>(context).data[index]['source']['name']??''  ,


                    title:   Provider.of<SourceProvider>(context).check==false?
                    '${  Provider.of<NewsCategory>(context).data[index]['title']??''}'  :
                    '${  Provider.of<EverythingProvider>(context).data[index]['title']??''}',
                    publishedAt:   Provider.of<SourceProvider>(context).check==false?
                    '${Provider.of<NewsCategory>(context).data[index]['publishedAt']??''}':
                    '${Provider.of<EverythingProvider>(context).data[index]['publishedAt']??''}',


                    url:  Provider.of<SourceProvider>(context).check==false?
                    Provider.of<NewsCategory>(context).data[index]['url']??'' :
                    Provider.of<EverythingProvider>(context).data[index]['url']??'',


                    content:  Provider.of<SourceProvider>(context).check==false?
                    Provider.of<NewsCategory>(context).data[index]['content']??'' :
                    Provider.of<EverythingProvider>(context).data[index]['content']??'',




    )

    ;
                } ,
              itemCount:  Provider.of<SourceProvider>(context).check==false?
              Provider.of<NewsCategory>(context).data.length:
              Provider.of<EverythingProvider>(context).data.length
                ,
              ),
            )

          ],
        ),
      ),
    );
  }
}
