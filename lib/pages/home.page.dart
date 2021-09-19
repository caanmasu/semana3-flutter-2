import 'package:flutter/material.dart';
import 'package:semana3noticias/models/articles.model.dart';
import 'package:semana3noticias/providers/articles.provider.dart';
import 'package:semana3noticias/widgets/card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ArticleProvider articleProvider = ArticleProvider();
  Future<List<Article>>? listArticles;

  @override
  void initState() {
    listArticles = articleProvider.getArticles();
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: _body(),
    );
  }

  _body() {
    return FutureBuilder(
      future: listArticles,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData){

          List<CardWidget> list = [];

          snapshot.data.forEach( (item) => list.add(CardWidget(article: item,)));
          return ListView(
            children: list,
          );
        } else
          return Text("No hay datos");
      }
    );
  }
}