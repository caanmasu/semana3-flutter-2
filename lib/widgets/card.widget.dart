import 'package:flutter/material.dart';
import 'package:semana3noticias/models/articles.model.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/pages/detalle.page.dart';

class CardWidget extends StatelessWidget {
  final Article article;

  CardWidget({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              article: article
            )
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 20, 0, 20),
                  child: Row(
                    children: [Text(DateFormat('dd-MM-yyyy').format(article.publishedAt))],
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
                      child: Text(article.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(article.description),
                    ),
              ],
            
            ),
            
          ),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      )
    );
  }
}