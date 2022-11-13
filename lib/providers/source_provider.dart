import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_again/utls/constant.dart';

class SourceProvider extends ChangeNotifier {

  List data = [];

  bool loading = false;
  bool check = false;
  changeCheck(  ) {
    check  = true  ;
    notifyListeners();
  }


  getSource({required String categoryName}) async {
    try {
      loading = true;
      notifyListeners();
      data = [];

      http.Response res =
      await
      http.get(
          Uri.parse(
              'https://newsapi.org/v2/top-headlines/sources?apiKey=9273e8c3654242b380ed9fdbba8f8254&category=$categoryName&country=us'
          ));
      if(res.statusCode == 200 ) {
        data = json.decode(res.body)['sources'];
        loading = false;
        notifyListeners() ;
      }else {

        loading =false;
        AppConstant().toast(txt: json.decode(res.body)['message'], color: Colors.red) ;
        notifyListeners() ;
      }
      notifyListeners();
    }on SocketException {
      AppConstant().toast(txt: 'no  internet', color: Colors.red) ;
      notifyListeners();

    } catch ( e)  {
      print (e.toString() ) ;
      AppConstant().toast(txt: 'Something went wrong, please try again'  , color: Colors.red) ;

    }
  }



}
// get
// post
// delete
// update