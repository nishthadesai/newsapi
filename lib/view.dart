import 'dart:convert';
import 'package:flutter/material.dart';
import 'service/apiservice.dart';
import '../model/article_model.dart.';
import 'package:api/components/detail.dart';
import 'package:http/http.dart' as http;

class View extends StatefulWidget {
  const View({super.key});

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  Apiservice client = Apiservice();

  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
      ),
      body: FutureBuilder(
        future: Apiservice().getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                  author: '${snapshot.data![index].author}',
                                  title: '${snapshot.data![index].title}',
                                  description: '${snapshot.data![index].description}',
                                  urlToImage: '${snapshot.data![index].urlToImage}',
                                  publishedAt: '${snapshot.data![index].publishedAt}',
                                ),),);
                      },
                      child: Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Image.network(
                                '${snapshot.data![index].urlToImage}',
                                height: 200,
                                width: 400,
                              ),
                              Text(
                                '${snapshot.data![index].title}',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.cyan),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${snapshot.data![index].description}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )));
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future _getData() async {

    try {var reponse;

      final response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=cbfd756aae624b60b552db55c9d65612'
              as Uri);

      if(reponse.statuscode==200){
final data=json.decode(response.body);
setState(() {
  _posts=data['articles'];
});
      }
    } catch (e) {
      print(e);
    }
  }
}
