import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/models/news_model.dart';

//Fetching default national category
class NewsData{

  List<NewsModel> newsData =[];

  Future<void>  getNews() async{

    var response= await get("https://inshortsapi.vercel.app/news?category=national");
    var jsonData= jsonDecode(response.body);

    if(jsonData['success']== true){

      jsonData['data'].forEach((element){

        NewsModel newsModel= NewsModel(title: element['title'], author: element['author'], content:element['content'] , date: element['date'], imageUrl: element['imageUrl']);

        newsData.add(newsModel); //Saving data from json
      });


    }



  }
}
//fetching for category wise
class CategoryData{

  List<NewsModel> newsData =[];

  Future<void>  getNews(String category) async{

    var response= await get("https://inshortsapi.vercel.app/news?category=$category");
    var jsonData= jsonDecode(response.body);

    if(jsonData['success']== true){

      jsonData['data'].forEach((element){

        NewsModel newsModel= NewsModel(title: element['title'], author: element['author'], content:element['content'] , date: element['date'], imageUrl: element['imageUrl']);

        newsData.add(newsModel);
      });


    }



  }
}