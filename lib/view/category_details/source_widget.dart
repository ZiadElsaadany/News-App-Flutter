import 'package:flutter/material.dart';
import 'package:news_app_again/providers/everyrhing_provider.dart';
import 'package:news_app_again/providers/source_provider.dart';
import 'package:provider/provider.dart';

import '../../utls/constant.dart';

class SourceWidget extends StatelessWidget {
  const SourceWidget({Key? key,required this.index}) : super(key: key);
final int index ;

@override
  Widget build(BuildContext context) {
    return           Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 0),
                  // height: 20,
                  decoration: BoxDecoration(
                      color:   Colors.white
                      ,
                      borderRadius: BorderRadius.circular(15) ,
                    border: Border.all(color: AppConstant.primaryColor)
                  ),
                  child: Text(Provider.of<SourceProvider>(context).data[index]['name'],
                    style: TextStyle(
                        color:  AppConstant.primaryColor ,
                        fontWeight: FontWeight.bold
                    ),),
                );
  }
}
