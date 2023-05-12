import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final author;
  final title;
  final description;
  final urlToImage;
  final publishedAt;

  Detail({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
          elevation: 5,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network('${urlToImage}'),
              SizedBox(
                height: 20,
              ),
              Text(
                '$author',
                style:
                TextStyle(fontSize: 20, color: Colors.red),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$title',
                style:
                TextStyle(fontSize: 20, color: Colors.cyan),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$description',),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                '$publishedAt',),
              SizedBox(
                height: 20,
              ),
            ],
          ))
    );
  }
}
