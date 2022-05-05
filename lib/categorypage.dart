import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:newsapp/datahelp/newsdata.dart';
import 'package:newsapp/models/news_model.dart';

class CategoryFragment extends StatefulWidget {
   CategoryFragment({Key? key,required this.category}) : super(key: key);

  String category;

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {

  List<NewsModel> newsarticles= <NewsModel>[];
  bool _loading= true;

  getNews() async{
    CategoryData news= CategoryData();
    await news.getNews(widget.category);
    newsarticles=news.newsData;
    setState(() {
      _loading=false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "News App",
          textAlign: TextAlign.center,
        ),
      ),

      body: _loading ? const Center(
        child: CircularProgressIndicator(),

      ):SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                itemCount: newsarticles.length,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context,index){
                  return NewsTemplate(title:newsarticles[index].title, author: newsarticles[index].author, content: newsarticles[index].content, date: newsarticles[index].date, imageUrl: newsarticles[index].imageUrl);

                },
                shrinkWrap: true,

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsTemplate extends StatelessWidget {
  NewsTemplate({Key ? key,required this.title,required this.author,required this.content,required this.date,required this.imageUrl}) : super(key: key);
  String title;
  String author;
  String content;
  String date;
  String imageUrl;
  // String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(imageUrl: imageUrl,width: 400,height: 250,fit: BoxFit.cover,),

          ),
          const SizedBox(
            height: 10,
          ),
          Text(title,style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),),
         const SizedBox(
          height: 8,
        ),
         Text(content,style: const TextStyle(
          fontSize: 15,
           color: Colors.black54,
        ),),
          const SizedBox(
            height:7 ,
          ),
        Row(
        children: [
             Text(date ,style: const TextStyle(
                  fontSize: 10,
                   color: Colors.black45,
           ),),
           Text(author,style: const TextStyle(
          fontSize: 10,
             color: Colors.black45,
          ),),
          ],
       ),
          const SizedBox(
           height:10 ,
         ),
          
      ],),
    );
  }
}

