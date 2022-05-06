import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:newsapp/categorypage.dart';
import 'package:newsapp/datahelp/categorydata.dart';
import 'package:newsapp/datahelp/newsdata.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

  List<CategoryModel> categories= <CategoryModel>[];
  List<NewsModel> newsarticles= <NewsModel>[];
  bool _loading = true;

  getNews() async{
    NewsData news= NewsData();
    await news.getNews();
    newsarticles=news.newsData;
    setState(() {
      _loading=false;
    });
  }



  @override
  void initState() {
    categories= getCategories();
    getNews();
    super.initState();
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
               height:50,
               child: ListView.builder(
                 scrollDirection:Axis.horizontal,
                 shrinkWrap: true,
                 itemBuilder: (context,index){
                   return CategoryCard(categoryName: categories[index].categoryName);
               },
                 itemCount: categories.length,

               ),
             ),
             SizedBox(

              child: Container(
                margin: const EdgeInsets.all(5),
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
          ),
           ],
         ),
      ),
    );
  }

}
//creating Menu of catergory
class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child:Text(categoryName),
          onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>CategoryFragment(category: categoryName.toLowerCase())),);

          },
        ),
      ],
    );
  }
}
//creating template for news article
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
        children: <Widget>[
          ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(imageUrl: imageUrl,width: 400,height: 250,fit: BoxFit.cover, placeholder: (context, url) => const CircularProgressIndicator(),),

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
        ],
      ),
    );
  }
}

