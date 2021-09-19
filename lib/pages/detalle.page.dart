import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/models/articles.model.dart';
import 'package:flutter_share/flutter_share.dart';

class DetailPage extends StatelessWidget {
  final Article article;

  DetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 18, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  share();
                },
                child: Icon(Icons.share),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 0, 20),
          child: Row(
            children: [Text("Fecha: ${DateFormat('dd-MM-yyyy').format(article.publishedAt)}")],
          ),
        ),

        article.urlToImage == ''
          ? Image(image: AssetImage('assets/no-image.jpg'),)
          : FadeInImage(
              placeholder: AssetImage('assets/loading.gif'), 
              image: NetworkImage(article.urlToImage)
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("Autor: ${article.author}")
          ],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Título: ${article.title}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Descripción: ${article.description}"),
        )
      ],

    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: article.title,
        text: article.description,
        linkUrl: article.url,
        chooserTitle: article.title);
  }

}