import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_again/utls/constant.dart';

class EverythingProvider extends ChangeNotifier {

  List data = [];

  bool loading = false;


bool loadingSearch = false;
List dataSearch =[] ;

  getEverything({required String sourceId}) async {
    try {
      loading = true;
      notifyListeners();
      data = [];
      http.Response res =
      await
      http.get(
          Uri.parse(
              'https://newsapi.org/v2/everything?apiKey=9273e8c3654242b380ed9fdbba8f8254&sources=$sourceId'
          ));
      if(res.statusCode == 200 ) {
        data = json.decode(res.body)['articles'];
        print(data) ;
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

  search({required String word} )  async {
    try {
      loadingSearch = true;
      notifyListeners();
      dataSearch = [];
      http.Response res =
      await
      http.get(
          Uri.parse(
              'https://newsapi.org/v2/everything?apiKey=9273e8c3654242b380ed9fdbba8f8254&q=$word'
          ));
      if(res.statusCode == 200 ) {
        dataSearch = json.decode(res.body)['articles'];
        loadingSearch = false;
        notifyListeners() ;
      }else {

        loadingSearch =false;
        AppConstant().toast(txt: json.decode(res.body)['message'], color: Colors.red) ;
        notifyListeners() ;
      }
      notifyListeners();
    }on SocketException {
      loadingSearch =false;
      AppConstant().toast(txt: 'no  internet', color: Colors.red) ;
      notifyListeners();

    } catch ( e)  {
      loadingSearch =false;

      print (e.toString() ) ;
      AppConstant().toast(txt: 'Something went wrong, please try again'  , color: Colors.red) ;

    }
  }



}
// get
// post
// delete
// update