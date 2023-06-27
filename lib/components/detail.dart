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
              Image.network('$urlToImage'),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$author',
                style:
                const TextStyle(fontSize: 20, color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$title',
                style:
                const TextStyle(fontSize: 20, color: Colors.cyan),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$description',),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 20,
              ),
              Text(
                '$publishedAt',),
              const SizedBox(
                height: 20,
              ),
            ],
          ))
    );
  }
}
